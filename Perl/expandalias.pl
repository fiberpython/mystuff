#!/usr/bin/perl

$subcee = "/Users/pturner/myintel";
open (FH, "$subcee");

while(<FH>){  
		my $line = $_;
		next if /^[ \t]*$/;		
		next if /^#/;
		next if /#/;
		$line =~ s/^*\://;
        print "$line";
        my @daline = split /,/, $line;

	   # my ($daline)=split(",", $line);
	    print "daline = @daline\n";
	    print "daline 0 = @daline[0]\n";
	    print "daline 1 = @daline[1]\n";
	    print "daline 2 = @daline[2]\n";

	    exit;

	    my (@seekihome)=split(",", @daline);
        #print "NOTHING TO SEE HERE daline = $daline\n";
	    #print ("GEE: @daline\n");
	    $n = 0;

# USE THE SCALAR FORM OF ARRAY??
while ($seekihome[$n]) {
	print "inhere too $n\n";
		$n++;
    print ("OK I see ya > @seekihome\n");
	print "$seekihome[$n]\tfound=$n\n";
}

       
#		print ("$line");
	    #my ($dropit,@daline)=split(":", $line);

	#system (date);

       }




# 		{
# 			#if an error is found send out a page.
# 			#print $line;
#                         $_ = $line;
#                         s/[^0-9a-zA-Z_\-?\w ]*//g;
#                         $line = $_;
# 			trap_die ( "Error  $alert_log_filename    $line" );
# 			##print "$line\n";
# 			last READ;
# 		}
# 		if ( $line !~ "^succeed" && $line =~ "[a-z]" &&(($alert_log_filename =~ "orafind") || ($alert_log_filename=~ "space_check")))
# 		{
# 			trap_die ( "Error  $alert_log_filename    $line" );
# 			last READ;
# 		}
# 	}
# 
#         seek(ALERT,0,2);
# 	my $LastPosition = tell ALERT;
# 	close ALERT;
# 
#         #get new byte offset from ls command, and print into the .count.log file.
#         open(OUTPUT, "> $alert_offset_filename");
# 	print OUTPUT $LastPosition;
# 	close OUTPUT;
# $i++;
# } # end foreach
# system (date);
# 
# 
