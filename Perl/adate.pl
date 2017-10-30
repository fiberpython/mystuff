#!/usr/bin/perl
use POSIX qw(strftime);
$now_string = strftime "%Y%e%m%H%M%S", localtime;

print "\n\n $now_string\n\n ";


# $dDate = system("/bin/date \"+%Y%e%m%H%M%S\"");
# print "\ndate = $dDate\n\n\n";

