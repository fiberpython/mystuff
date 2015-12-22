#!/usr/bin/perl

# solrbackup.pl
# there is a config file that this script uses.
# the config file must be set up correctly or undesied results will occur
# Basically this script will read thur a config file and then build
# backup/dump command and run.
# date: 12/16/2015
# Ver: 0.2.1


use strict;
use warnings;
use Switch;

my @myStack;
my @spanOutIndexes;
my $properIndexValue="";
my $solr_backup_version="";
my $backupPortUsed="";
my $backupCollectionUsed="";
my $actionCommandsOnIndex="";
my $backup_host_name="";
my $snapShotLocation="";
my $simpleParseIndex="";
my $solr_retention_cycle="";
my $saveSnapShotLocation="";


 # $a = "-f";

# if ($a eq $ARGV[0] && defined $ARGV[1]) { 
if (defined $ARGV[0]) {
       &validParamtersPassed;
 } else {
       &The_incorrect_Parameters_were_passed;
}

sub  mytrim { my $s = shift; $s =~ s/^\s+|\s+$//g; return $s };

sub validParamtersPassed
{

    # Reading the configuation file here
    open(CONFIGURATION, "$ARGV[0]") or die "Can not open file $ARGV[0]. \n";
    while(<CONFIGURATION>){
    	my $line = $_;
    	next if /^#/;
    	next if /^[ \t]*$/;
    	next if /^$/;
        push @myStack, "$line";    #saving lines of interests from the configuration file.
     }

    close(CONFIGURATION);



 foreach (@myStack) {
        # if $_ has any commas then this is going be split up , so jump , split, parse until the end
        &listAllIndexs if /,/;  #happens when collection name has commas then you will have more than 1 core and this also assumes that the user left the collection statement in the last line of the conf.

        my ($check_it, $val) = split /=/, $_;
#	mytrim($check_it);
#	mytrim($val);
        chomp($val);

    switch(mytrim($check_it)) {
        case "solrHome"               { $solr_backup_version = $val }
        case "retentionCycle"             { $solr_retention_cycle = $val }
        case "solrPort"                     { $backupPortUsed = $val;
						if ($val =~ /\D/) { print "bad value passed\n\n$val\n"; exit;} }
        case "solrIndex"                { $backupCollectionUsed = $val }
        case "commandAction"                 { $actionCommandsOnIndex  = $val}
        case "solrHostname"         { $backup_host_name = $val}
        case "coreLocation"                  { $snapShotLocation = $val }
        else                                  { print "we have an invalid conf file\n\n\n";
						print " value is  \"$check_it\" \n\n";
					        exit; }

    }  # ends the switch
  } # this ends foreach
 	&runningOnlyOneIndex;
} # this ends sub



 # print "/usr/bin/curl -v http://$backup_host_name:$backupPortUsed/$solr_backup_version/$backupCollectionUsed/replication?command=$actionCommandsOnIndex&location=$snapShotLocation&numberToKeep=2\n";


#  system "/usr/bin/curl -v 'http://$backup_host_name:$backupPortUsed/$solr_backup_version/$backupCollectionUsed/replication?command=$actionCommandsOnIndex&location=$snapShotLocation&numberToKeep=$solr_retention_cycle'";
 exit;

# curl -v http://katana.cul.columbia.edu:8080/solr-4.7/ciao_dev/replication?command=backup
# this states the location and must be   surrounded by quotes
# curl -v 'http://katana.cul.columbia.edu:8080/solr-4.7/ciao_dev/replication?command=backup&location=/tmp'


sub The_incorrect_Parameters_were_passed
{
print "\n the incorrect parameters where sent Please check the invoking feature \n";
}

sub listAllIndexs
{
 my ($simpleParseIndex) = $_;
 $saveSnapShotLocation = $snapShotLocation;
 my ($configVariable, $configFileElement) = split /=/, $simpleParseIndex;
 chomp($configFileElement);
 @spanOutIndexes = split /,/, $configFileElement;

        foreach $properIndexValue (@spanOutIndexes) {
            $backupCollectionUsed = $properIndexValue;
            $snapShotLocation = $snapShotLocation . "/" . $properIndexValue . "/data";
            print "/usr/bin/curl -v http://$backup_host_name:$backupPortUsed/$solr_backup_version/$backupCollectionUsed/replication?command=$actionCommandsOnIndex&location=$snapShotLocation&numberToKeep=$solr_retention_cycle\n\n";
            system "/usr/bin/curl -v 'http://$backup_host_name:$backupPortUsed/$solr_backup_version/$backupCollectionUsed/replication?command=$actionCommandsOnIndex&location=$snapShotLocation&numberToKeep=$solr_retention_cycle'";
            system("sleep 150");
            $snapShotLocation = $saveSnapShotLocation; # refreshes the path so that it can loop thur the queue
        }
exit;
}
sub runningOnlyOneIndex
{

 $snapShotLocation = $snapShotLocation . "/" . $backupCollectionUsed . "/data";
 print "I'm only running 1 index here\n\n";
 print "/usr/bin/curl -v http://$backup_host_name:$backupPortUsed/$solr_backup_version/$backupCollectionUsed/replication?command=$actionCommandsOnIndex&location=$snapShotLocation&numberToKeep=$solr_retention_cycle\n";
 system"/usr/bin/curl -v 'http://$backup_host_name:$backupPortUsed/$solr_backup_version/$backupCollectionUsed/replication?command=$actionCommandsOnIndex&location=$snapShotLocation&numberToKeep=$solr_retention_cycle'";

exit;
}