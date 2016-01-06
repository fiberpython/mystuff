#!/usr/bin/perl

use strict;
use warnings;
use DateTime;

my $dt   = DateTime->now;   # Stores current date and time as datetime object
my $date = $dt->ymd;   # Retrieves date as a string in 'yyyy-mm-dd' format
my $time = $dt->hms;   # Retrieves time as a string in 'hh:mm:ss' format

my $wanted = "$date $time";   # creates 'yyyy-mm-dd hh:mm:ss' string
print $wanted;


