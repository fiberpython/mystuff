#!/usr/bin/perl

use Capture::Tiny::Extended 'capture';
 
my ( $out, $err, $res ) = capture { system( 'ls' ) };

print "\nout = $out \n";
print "\nerror = $err\n\n";
print "\nResults = $res\n";


