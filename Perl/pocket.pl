#!/usr/bin/perl

use Socket;

($name, $aliases, $addrtype, $length, @addrs) = gethostbyname "fibershell.com";
print "Host name is $name\n";
print "Aliases is $aliases\n";

