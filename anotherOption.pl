#!/usr/bin/perl
{
        my @param =@_;
        $message = $param[0];
        $hostname="smtp.temple.edu";
        @receipt = ("shaoc\@temple.edu");
        $smtp = Net::SMTP->new($hostname);
        $sender="ora10_eratest\@temple.edu";
        foreach  $recpt (@receipt)
        {
                $smtp->mail($sender);
                $smtp->to($recpt);
                $smtp->data();
                $smtp->datasend("Subject: $message\n");
                $smtp->datasend("$message\n");
                $smtp->dataend();
        }
        $smtp->quit;
}

@instance = (test,test1);
@monited_file_name = (
"/opt/oracle/product_10g/eratest/10.2/dba/eratest/orafinder/orafinder.txt",
"/opt/oracle/product_10g/eratest/10.2/dba/eratest/space_checker/space_check.txt",
"/opt/oracle/product_10g/eratest/10.2/dba/eratest/analyze/analyze.txt",
"/opt/oracle/product_10g/eratest/10.2/dba/eratest/rbackup/rbackup.txt",
"/opt/oracle/product_10g/eratest/10.2/dba/erarpt/rbackup/rbackup.txt",
"/opt/oracle/product_10g/eratest/10.2/dba/eratest/reports/clean_perfstat_eratest.txt",
"/opt/oracle/product_10g/erastdby/10.2/dba/erastdby/standby/standby_monitoring_log.txt"
);
@monited_file_log = (
"/opt/oracle/product_10g/eratest/10.2/dba/eratest/report_monitoring/orafinder.log",
"/opt/oracle/product_10g/eratest/10.2/dba/eratest/report_monitoring/space_check.log",
"/opt/oracle/product_10g/eratest/10.2/dba/eratest/report_monitoring/analyze.log",
"/opt/oracle/product_10g/eratest/10.2/dba/eratest/report_monitoring/rbackup_eratest.log",
"/opt/oracle/product_10g/eratest/10.2/dba/eratest/report_monitoring/rbackup_erarpt.log",
"/opt/oracle/product_10g/eratest/10.2/dba/eratest/report_monitoring/clean_perfstat_eratest.log",
"/opt/oracle/product_10g/eratest/10.2/dba/eratest/report_monitoring/standby_monitoring.log");
my $i = 0;
while ($i <= $#monited_file_name)
{
##	$alert_offset_filename = $monited_file_name[$i]; 
##	$alert_log_filename = $monited_file_log[$i];

	$alert_offset_filename = $monited_file_log[$i]; 
	$alert_log_filename = $monited_file_name[$i];

	$offset = `cat $alert_offset_filename` || 2;
#	print "Offset: $offset\n";
#	print "path is $alert_log_filename\n";

	#open log file for reading.
	
	open ALERT,$alert_log_filename || trap_die("Oracle: Cannot open: $alert_log_filename");
	if(!seek (ALERT,$offset - 1,0)) 
	{
		my ($j1,$j2,$j3,$j4,$j5,$j6,$j7,$fsize,$j9,$j10,$j11,$j12,$j13) = stat ALERT;
                $offset=$fsize;
                seek(ALERT,$offset-1,0);	
	}
READ:	while(<ALERT>) 
	{
		my $line = $_;
		#look for error messages.
		if(($line =~ "ORA-") or ($line =~ /not/i)) 
		{
			#if an error is found send out a page.
			#print $line;
                        $_ = $line;
                        s/[^0-9a-zA-Z_\-?\w ]*//g;
                        $line = $_;
			trap_die ( "Error  $alert_log_filename    $line" );
			##print "$line\n";
			last READ;
		}
		if ( $line !~ "^succeed" && $line =~ "[a-z]" &&(($alert_log_filename =~ "orafind") || ($alert_log_filename=~ "space_check")))
		{
			trap_die ( "Error  $alert_log_filename    $line" );
			last READ;
		}
	}

        seek(ALERT,0,2);
	my $LastPosition = tell ALERT;
	close ALERT;

        #get new byte offset from ls command, and print into the .count.log file.
        open(OUTPUT, "> $alert_offset_filename");
	print OUTPUT $LastPosition;
	close OUTPUT;
$i++;
} # end foreach
system (date);
