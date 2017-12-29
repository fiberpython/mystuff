#!/usr/bin/perl
use Switch;

#$fileopen = "/Users/pat2149/Documents/CU/storage_num.txt";
$fileopen = "/Users/pat2149/Documents/CU/storage_local_updated.txt";

 
$dollar=1;
# $i=0;
$stortotal = 0;



# $fileopen = "/Users/pat2149/Documents/CU/storage_local_updated.txt";
# why this is because the first time thur this is not going to be a 
# contact swtich but later it will be
# $fileopen = "/Users/pat2149/Documents/CU/newStorageupdate.txt";

open (fileinopen, "<", "$fileopen")  || die "Can't open input_file: $!\n";

LINE: while($lineinme = <fileinopen>){
     $lineinme =~ s/^\s+//;
     #:wprint "lineinme = $lineinme\n";
    

    if (($lineinme =~ /columbia/) && ($dollar == 2)){
                $columbia =~ s/://;
          $swtiching = "$columbia" . "," . "$stortotal" . "G";

                push (@theswitch, $swtiching); 

            $stortotal = 0;
            #$columbia = $lineinme;
            &checkforcontecx;
     } 
     elsif (($lineinme =~ /columbia/) && ($dollar == 1)) {
                $columbia =~ s/://;
          $swtiching = "$columbia" . "," . "$stortotal" . "G";

                push (@theswitch, $swtiching); 

            $stortotal = 0;
            #$columbia = $lineinme;
            $dollar = 2;
            &checkforcontecx;

     }


    # if ($lineinme =~ m/columbia/) {
    #   $stortotal = 0;
    #   $columbia = $lineinme;
    #   next;
    # }


      &myswapcheck1;

      @getsplit = split(/\s+/, $lineinme);
      $valuesadd = @getsplit[1];
      &mymegcheck1;
      &mygigcheck1;
      &mytercheck1;
      &mykcheck1;
      $stortotal = $stortotal + $valuesadd;
      # print "\nNow stortotal = $stortotal and this is $valuesadd\n";

          # print "$stortotal\n";
          # print "swtiching=$swtiching\n";
          # push (@theswitch, $swtiching); 



    } # End the While lineinme loop



foreach (@theswitch)
{
     print "$_\n";
}

exit;

sub checkforcontecx {

  #print "Count = $seecount for $lineinme";
  # $seecount = $seecount + 1;
  # here is where we discover the value of a dollar 0 then make it one if 1 then push on to the stack
  if ($dollar == 1) { 
                      $dollar = 2; 
                      #print "this is the first time thru and dollar is $dollar\n"; 
                      chomp($lineinme); 
                      $columbia = $lineinme;
                      next LINE;
                    }
  if ($dollar == 2) {   
                        chomp($lineinme);
                        $columbia = $lineinme;
                        # print "Host: $columbia = $stortotal\n";
                        $swtiching = $columbia . " = " . $stortotal;
#                        push (@theswitch, $swtiching); 

                        next LINE;
                       
      }
}



sub myswapcheck1 {
  if ($lineinme =~ m/tmpfs/){
        next;
  }
}

sub mymegcheck1 {

  if ($valuesadd =~ m/M/) {
     $valuesadd =~ s/M//;
      $valuesadd = ($valuesadd/1000);
   }
}


sub mygigcheck1 {
  if ($valuesadd =~ m/G/) {
     $valuesadd =~ s/G//;

  }
}

sub mytercheck1{
  if ($valuesadd =~ m/\d+T/) {  
     $valuesadd =~ s/T//;
     #print "Tera = $valuesadd BEFORE \n";
     $valuesadd = ($valuesadd * 1000);
     #print "Tera = $valuesadd  AFTER\n";

   }
}

sub mykcheck1{         
  if ($valuesadd =~ m/K/) {  
    next;
    $valuesadd =~ s/T//;
    $valuesadd = $valuesadd;
  }
}
