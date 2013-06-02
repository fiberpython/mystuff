#!/usr/bin/perl

# opmn_check.pl

# usage     :   Check status of OPMM components and send email alert if component is down
# history   :   06/13/2008 -  Paul Turner -  original script

use Net::SMTP;

sub trap_die
{
        my @param =@_;
        $message = $param[0];
        $hostname="smtp.temple.edu";
        @receipt = ("bhuttie\@temple.edu","shaoc\@temple.edu","pturner\@temple.edu","innap\@temple.edu");
        $smtp = Net::SMTP->new($hostname);
        $sender=$host."\@temple.edu";
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

sub print_date
{      use Time::localtime;
       my $tm = localtime;
       sprintf(" at time  %04d-%02d-%02d %02d:%02d:%02d\n",
         $tm->year+1900,
         ($tm->mon)+1,$tm->mday,$tm->hour,$tm->min,$tm->sec);
}

my $ORACLE_HOME = "/usr/local/app/oracle/product/10.2.0/OraFRS_1";
my $hostname = `hostname`;
@temphostname = split /\./, $hostname;
$host = $temphostname[0];
@opmnstat = `$ORACLE_HOME/opmn/bin/opmnctl status -noheaders -fsep '|' -fmt %cmp11%prt15%sta6`;
foreach $line (@opmnstat)
{
	@field = split /\|/, $line; 
	$iascomp = $field[0];
	$iascomp =~ s/\s+$//;
        $ptype = $field[1];
	$ptype =~ s/\s+$//;
        $pstat = $field[2];
	$pstat =~ s/\s+$//;
	if (($pstat eq "Down") or ($pstat eq "Alive"))
	{
		print "$iascomp\t$ptype\t$pstat\n";
		if ($pstat eq "Down")
		{
			#if (($iascomp eq "DSA") or ($iascomp eq "LogLoader"))
			if ($iascomp eq "DSA") ## for testing
			{
			 	# DSA is down in all current OPMN environments	
				print "We expect $iascomp to be down so not sending alert\n";
			}
			else
			{	
                        	$message= $host." ".OPMN." ".Process." ".Type." ".$ptype." ".$pstat.print_date;
				trap_die($message);
			}
		}
	}
}
$finalmsg=print_date;
print "succeed $finalmsg";	
