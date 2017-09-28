#!/usr/bin/perl

# This problem take the 1st char of one string
# and the first char of the other strings and
# stitches it together and should handle size
# as to exsaust the iterations

@a = qw(a b c);
@b = qw(D F H);

$asize = scalar(@a);
$bsize = scalar(@b);

if ($asize == $bsize)  {
   for ($x = 0; $x < $asize; ++$x){
    $ans = $ans . "@a[$x]@b[$x]"
  }
}
if ($asize < $bsize)  {

   for ($x = 0; $x < $bsize; ++$x){
    $ans = $ans . "@a[$x]@b[$x]"
  }
}
if ($asize > $bsize)  {
   for ($x = 0; $x < $asize; ++$x){
    $ans = $ans . "@a[$x]@b[$x]"
   }
}

print ("Answer is = $ans")
