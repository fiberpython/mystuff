# #!/usr/bin/perl
#!/opt/local/bin/perl 

print "wi";
break;
use Switch;

@array1 = ("abc", abb, "p", "p", "nameme","abc");


foreach $val (@array1) { 

	switch($val) {
		
		case "abc"	{ print "you have abc\n\n" }
		case "abb"  { print "you have port\n\n" }
		case "p"    { print "you have funk\n\n" }
		else		{ print "there is nothing going on here now\n\n\n" }

	}

}
