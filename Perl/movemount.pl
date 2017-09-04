#!/opt/local/bin/perl

$odirs = '/Users/pturner/Documents/Var/bin/odirs.txt';
$ofiles = '/Users/pturner/Documents/Var/bin/ofiles.txt';

open INFILE1, "$odirs";
@myodirs = <INFILE1>;
close INFILE1;

open INFILE2, "$ofiles";
@myofiles = <INFILE2>;
close INFILE2;


for (@myofiles) {
$a = $_;
chomp($a);
 # print $a;
$_ =~ s/\.zip//g;
print "mv $a $_";

}


