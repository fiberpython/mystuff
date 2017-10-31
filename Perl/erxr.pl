#!/usr/bin/perl

sub chkoutit($passingval) {

	$variableset = strip(/$passingval/,/%/);
	if ($variableset is in the range |80-100|) {
		statisis = TRUE;
		exit 1
	}
        statusis = FALSE;
}


$hnam = `hostname`




@andlines = `df -h`;
print "The df is:\n\n @andlines";

print "this is the split line thing";
@anlines = split /\n/, @andlines;
print "anlines = \n\n @anlines";

foreach my $line (@andlines) {
	($a, $b, $c, $d, $f, $g) = split /\s/, $line;
        if (chkoutit($f)) {
		 system("/bin/mail -s 'File system $g is $f full' paulturner41@gmail.com ")
	}



}
