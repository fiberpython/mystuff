#!/usr/bin/perl

# solrbackup.pl
# there is a config file that this script uses.
# the config file must be set up correctly or undesired results will occur
# Basically this script will read through a config file and then build
# backup/dump command and run.
# date: 12/16/2015
# Ver: 0.2.1


use strict;
use warnings;
use Switch;
use POSIX qw(strftime);


my @myStack;
my $dumpDate="";
my @spanOutIndexes;
my $properIndexValue="";
my $solrBackupVersion="";
my $backupPortUsed="";
my $backupCollectionUsed="";
my $commandAction="";
my $backup_host_name="";
my $snapShotLocation="";
my $simpleParseIndex="";
my $solrRetentionCycle="";
my $saveSnapShotLocation="";


######################   BEGIN MAIN ###############################################

if (defined $ARGV[0]) {
       &vaildParametersPassed;
 } else {
       &The_incorrect_Parameters_were_passed;
}
 exit;

#######################  END OF MAIN ###########################################

sub  mytrim { my $s = shift; $s =~ s/^\s+|\s+$//g; return $s };

# you get here if when this file is run
# there is a file that is passed along

sub vaildParametersPassed
{

# Reading the configuation file here
# 	@patterns = ( qr/^#/, qr/^[ \t]*$/, qr/^$/ );

 # don't have perl 5.10 and need it for the regex joining
    open(CONFIGURATION, "$ARGV[0]") or die "Can not open file $ARGV[0]. \n";
    while(<CONFIGURATION>){
    	my $line = $_;
        # next if ( $line ~~ @patterns ); this is looking for a module
    	 next if /^#/;
    	 next if /^[ \t]*$/;
    	 next if /^$/;
        push @myStack, "$line";    #saving lines of interests from the configuration file.
     }

    close(CONFIGURATION);


 foreach (@myStack) {
   # if $_ has any commas then this is
   # going be split up , so jump , split, parse until the end
   # the if below happens when the collection name
   # has commas in them that means that you will have more than
   # one core and this also
   # assumes that the user left the collection statement
   # in the last line of the conf.

   &parseThenBackup if /,/;
   my ($keyPair, $valuePair) = split /=/, $_;

   chomp($valuePair);

   switch(mytrim($keyPair)) {
      case "solrHome"          { $solrBackupVersion = $valuePair; $valuePair=mytrim($valuePair);
				 if ($valuePair !~ /(\w*)/) {print "check your config file: $valuePair\n";exit;}  }
      case "retentionCycle"    { $solrRetentionCycle = $valuePair; $valuePair=mytrim($valuePair);
   			         if ($valuePair !~ /(\d*)/) { print "bad value passed\n\n$valuePair\n"; exit;}  }
      case "solrPort"          { $backupPortUsed = $valuePair; $valuePair=mytrim($valuePair);
				   if ($valuePair !~ /(\d*)/) { print "bad value passed\n\n$valuePair\n"; exit;} }
      case "solrIndex"         { $backupCollectionUsed = $valuePair; $valuePair=mytrim($valuePair);
                                 if ($valuePair !~ /(\w*)/) {print "check your config file: $valuePair\n";exit;}  }
      case "commandAction"     { $commandAction  = $valuePair; $valuePair=mytrim($valuePair);
                                 if ($valuePair !~ /(\w*)/) {print "check your config file: $valuePair\n";exit;}  }
      case "solrHostname"      { $backup_host_name = $valuePair; $valuePair=mytrim($valuePair);
                                 if ($valuePair !~ /(\w*)/) {print "check your config file: $valuePair\n";exit;}  }
      case "coreLocation"      { $snapShotLocation = $valuePair; $valuePair=mytrim($valuePair);
                                 if ($valuePair !~ /(\w*)/) {print "check your config file: $valuePair\n";exit;}  }
        else                     { print "we have an invalid conf file\n\n\n";
			           print " value is  \"$keyPair\" \n\n";
			           exit; }

    }  # ends the switch
  } # this ends foreach
 	&backingUpSingleCore; # if the foreach gets done then there is only 1
} # this ends sub



sub The_incorrect_Parameters_were_passed
{

  print "\n you must supply a configuraiton file inorder to run this backup. \n";

}


 # this sub will do the backup of however many cores that need to be backed up

sub parseThenBackup
{
 my ($simpleParseIndex) = $_;
 $saveSnapShotLocation = $snapShotLocation;
 my ($configVariable, $configFileElement) = split /=/, $simpleParseIndex;
 chomp($configFileElement);
 @spanOutIndexes = split /,/, $configFileElement;
   foreach $properIndexValue (@spanOutIndexes) {
     $backupCollectionUsed = $properIndexValue;
     $dumpDate = strftime "%Y%m%e%H%M%S", localtime;
     $snapShotLocation = $snapShotLocation . "/" . $properIndexValue . "_" . $solrBackupVersion . "_" . $dumpDate . "/data";
     # exit;   i'm not sure why I have this exit here but I may need to uncomment this exit
     print "/usr/bin/curl -v http://$backup_host_name:$backupPortUsed/$solrBackupVersion/$backupCollectionUsed/replication?command=$commandAction&location=$snapShotLocation&numberToKeep=$solrRetentionCycle\n\n";
     system "/usr/bin/curl -v 'http://$backup_host_name:$backupPortUsed/$solrBackupVersion/$backupCollectionUsed/replication?command=$commandAction&location=$snapShotLocation&numberToKeep=$solrRetentionCycle'";
     system("sleep 150");
     $snapShotLocation = $saveSnapShotLocation; # refreshes the path so that it can loop thur the queue
        }
exit;
}


# once you get here you are only backing up one image/core
sub backingUpSingleCore
{
 $dumpDate = strftime "%Y%m%e%H%M%S", localtime;
 $snapShotLocation = $snapShotLocation . "/" . $backupCollectionUsed . "_" . $solrBackupVersion . "_" . $dumpDate . "/data";
 print "Timestamp = $dumpDate Backing up: $backup_host_name:$backupCollectionUsed:$solrBackupVersion\n";
 print "/usr/bin/curl -v http://$backup_host_name:$backupPortUsed/$solrBackupVersion/$backupCollectionUsed/replication?command=$commandAction&location=$snapShotLocation&numberToKeep=$solrRetentionCycle\n";
 system"/usr/bin/curl -v 'http://$backup_host_name:$backupPortUsed/$solrBackupVersion/$backupCollectionUsed/replication?command=$commandAction&location=$snapShotLocation&numberToKeep=$solrRetentionCycle'";
 exit;
}




