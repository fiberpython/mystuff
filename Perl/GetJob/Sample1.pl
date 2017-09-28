#!/usr/bin/perl

@array = qw(a b c );

print ("@array\n\n");

for ($i = 0; $i < 3; ++$i) {
  print ($array[$i], "= $i\n");
}
