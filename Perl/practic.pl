#!/usr/bin/perl


@openforread = `/bin/cat greenfile`;

foreach my $line (@openforread) {
	print " echo $line@columbia.edu >> printout\n";
	print "expn $line@columbia.edu >> printout\n";
	print "date >> printout\n";
}




