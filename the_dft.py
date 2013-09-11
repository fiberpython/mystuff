import subprocess
import sys

dfh=subprocess.check_output("df -h |grep '[0-9]%'", shell=True)
df_output_lines = [s.split() for s in dfh.splitlines()]
how_many_lines = dfh.count("\n")

for x in range(how_many_lines):
        fsmb = df_output_lines[x].pop()
        prsb = df_output_lines[x].pop()
        numbb = prsb[::1].strip().replace("%","")
        if int(numbb) > 80:
            mymess = "filesystem {fsb} is {pcbb} full and over the allotted threshold".format(fsb=fsmb, pcbb=prsb)
            cmd="""echo "%s" | /usr/bin/mailx -s '%s' pturner""" % (mymess, mymess)
            p=subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE)
            output, errors = p.communicate()
            
            # print "filesystem {fsb} is {pcbb} full and over the allotted threshold".format(fsb=fsmb, pcbb=prsb)
            
"""
You can use op.popen to run the command and retrieve its output, 
then splitlines and split to split the lines and fields. Run 
df -Ph rather than df -h so that lines are not split if a column is too long.

df_output_lines = [s.split() for s in os.popen("df -Ph").read().splitlines()]
The result is a list of lines. To extract the first column, you can 
use [line[0] for line in df_output_lines] (note that columns are numbered from 0) 
and so on. You may want to use df_output_lines[1:] instead of df_output_lines to strip the title line.

If you already have the output of df -h stored in a file somewhere, you'll need to join the lines first.

fixed_df_output = re.sub('\n\s+', ' ', raw_df_output.read())
df_output_lines = [s.split() for s in fixed_df_output.splitlines()]
Note that this assumes that neither the filesystem name nor the mount point contain whitespace. 
If they do (which is possible with some setups on some unix variants), 
it's practically impossible to parse the output of df, even df -P. 
You can use os.statvfs to obtain information on a given 
filesystem (this is the Python interface to the C function that df calls 
internally for each filesystem), but there's no portable way of enumerating the filesystems.
            """
