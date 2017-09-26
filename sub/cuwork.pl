#!/usr/bin/perl

$subcee = "/Users/pturner/myintel";
open (FH, "$subcee");

while(<FH>){  
		my $line = $_;
		next if /^[ \t]*$/;		
		next if /^#/;
		next if /#/;
		next if (!m/@/);  # if there is no at sign then we don't need to be here NEXT
		$line =~ s/^.*://;  #takes away the first part of the line before the :
        my @daline = split /,/, $line;


  foreach my $val (@daline) {
    next if $val !~ /\@columbia.edu/;
    system ("sleep 2");
    print "/opt/local/bin/expn $val\n";

    
    # @ans = `/opt/local/bin/expn $val 2>&1`; # here I'm trying to capture the output from the command
        # /opt/local/bin/expn $val

  }

       }



