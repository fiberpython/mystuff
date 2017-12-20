""" This example uses Python Fabric to deploy MySQL/MariaDB and Apache on five
servers """

# import all the fabric functions that we need explicitly
from fabric.api import env, roles, sudo, execute, put, run, local, lcd, prompt, cd, parallel

# import the os module to get file basenames
import os

# define groups of webservers and databases
env.roledefs = {
    "webserver" : [ "172.31.18.225","172.31.99.87","172.31.110.13" ],
    "database":[ "172.31.118.128","172.31.43.92" ],


}

# define a special group called all so we can easily send out commands to all servers if needed
env.roledefs["all"] = [h for r in env.roledefs.values() for h in r]

# the packages that are required to run our application on the server groups
packages_required = {
    "webserver" : [	"httpd","php","ntp","php-mysqli"],
    "database" : [ "mariadb-server" ]
}

# files that need to be downloaded from the labserver repo
download_files = {
    "database" : ["http://labfiles.linuxacademy.com/python/fabric/sakila.sql",
                  "http://labfiles.linuxacademy.com/python/fabric/sakila-data.sql"],
    "webserver" : ["http://labfiles.linuxacademy.com/python/fabric/index.php"]
}



@roles("database") # this decorater will make the the function following it  run for all database group server
def install_database():
    # install the database application
    # sudo is used when you need to run a cmd on the remote server as superuser
    sudo("yum -y install %s" % " ".join(packages_required["database"]),pty=True)

    # active MySQL/MariaDB in the system control
    sudo("systemctl enable mariadb",pty=True)

    # start MySQL/MariaDB using the system control
    sudo("systemctl start mariadb",pty=True)

    # Create a user on the database that we will be using from our webservers
    sudo(r""" mysql -h 127.0.0.1 -u root -e "CREATE USER 'web'@'%' IDENTIFIED BY 'web'; GRANT ALL PRIVILEGES ON *.* TO 'web'@'%'; FLUSH PRIVILEGES; "   """ )

    # Check for the mysql process is running
    # This is how you run a command when you do not need super user
    run("ps -ef |grep mysql")

@parallel
@roles("database") # this decorater will make the the function following it  run for all database group server
def setup_database():
    #setup the tmp directory where we will download files from the web
    tmpdir = "/tmp"

    # this cd is the fabric command to change directory on the remote server
    with cd(tmpdir): # cd changes the dir on the remote server

        # iterate over the files we need to download for the database
        for url in download_files["database"]:
            # basename gives us just the name of the file, without any path info, it also works for urls
            filename = "%s/%s" %(tmpdir, os.path.basename(url));

            # using the function run on the remote server, we can execute commands, in this case wget which opens the url and save it to fileame
            run("wget --no-cache %s -O %s" % (url, filename))

            # since these are SQL files, we can just dump them into out MySQL/MariaDB server
            run( "mysql -u root < %s" % filename )


@roles("webserver") # this decorater will make the the function following it  run for all webserver group server
def install_webserver():
    # install the webserver applications
    # sudo is used when you need to run a cmd on the remote server as superuser
    sudo("yum -y install %s" % " ".join(packages_required["webserver"]),pty=True)

    # active and start httpd
    sudo("systemctl enable httpd.service", pty=True)
    sudo("systemctl start httpd.service", pty=True)

    # here are some SElinux commands to get this working
    sudo("setsebool -P httpd_can_network_connect=1", pty=True)
    sudo("setsebool -P httpd_read_user_content=1", pty=True)


@roles("webserver") # this decorater will make the the function following it  run for all webserver group server
def setup_webserver():
    #setup the tmp directory where we will download files from the web
    tmpdir = "/tmp"

    # directory on the remote server
    remote_dir = "/var/www/html"

    # this time we will download the files on our master server and then put them on the remote server to see the functionality
    with lcd(tmpdir):
        # iterate over the files we need to download for the webserver
        for url in download_files["webserver"]:
            # basename gives us just the name of the file, without any path info, it also works for urls
            filename = "%s/%s" %(tmpdir, os.path.basename(url));

            # local runs the command locally on our local server
            local("wget --no-cache %s -O %s" % (url, filename))

            # and put sends a file from the local server to the remote server
            # we can also change the running permissions
            # and use sudo if required
            put(filename, "/var/www/html/", mode=0755, use_sudo=True)



    # the webserver need to connect to a database in the back
    database = pick_server(env.roledefs["database"])

    # again using sudo, we can just create a file on the remote server,
    # and put in the database server we got back from the function
    sudo(r""" echo " <?php \\$db = '%s'; ?> " > /var/www/html/db.php """ % env.roledefs['database'][database])


def pick_server(mylist):
    # simple function that takes a list and enumerates it
    # and asks the user to select a valid member from the list
    database = 0
    while not 1<=database<=len(mylist):
        print '*'*10
        for i, db in enumerate(mylist,1):
            print "[%s] - %s" % (i, db)
        database = prompt("Enter the number of the database should I connect %s to:   " % (env.host) , validate=int)
        return int(database)-1


@roles("all") # this decorater will make the the function following it  run for all servers
def upgrade_servers():
    # Just doing a upgrade on the CentOS
    sudo("yum -y upgrade",pty=True)




# this is the main function we will be calling to get it all running
def deploy():
    # note here that the execute function has the names of the functions we
    # are calling, but we are excluding the parenthesis()
    execute(upgrade_servers)
    execute(install_database)
    execute(install_webserver)
    execute(setup_database)
    execute(setup_webserver)
    print "Rock and Roll!!"
