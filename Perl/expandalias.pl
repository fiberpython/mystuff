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
        my @The_line = split /,/, $line;

	   # my ($The_line)=split(",", $line);
	    print "The_line = @The_line\n";
	    print "The_line 0 = @The_line[0]\n";
	    print "The_line 1 = @The_line[1]\n";
	    print "The_line 2 = @The_line[2]\n";

	    exit;

	    my (@seekihome)=split(",", @The_line);
        #print "NOTHING TO SEE HERE The_line = $The_line\n";
	    #print ("GEE: @The_line\n");
	    $n = 0;

# USE THE SCALAR FORM OF ARRAY??
while ($seekihome[$n]) {
	print "inhere too $n\n";
		$n++;
    print ("OK I see ya > @seekihome\n");
	print "$seekihome[$n]\tfound=$n\n";
}

       
#		print ("$line");
	    #my ($dropit,@The_line)=split(":", $line);

	#system (The_te);

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
# system (The_te);
# 
# 
