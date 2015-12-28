#!/usr/bin/perl
 
# newnewcunix.columbia.edu
# culcheck.pl
#
# this is the expn script will read from aliases.shadow and find the
# # users email from Staff and Community. The check happens from a Global Arrary
# # where this is set up to eliminate double checking the list. There are not parameters 
# # passed. 
#
# # ver:0.1.1     
# # Create date: 12/17/2015
# # pat2149 last updated: 12/17/2015
# #   - made variable name changes
# #   - make structural changes
# targetFile = "/etc/aliases.shadow";
#
#


 $localDateAndTime =`date`;
 print ("\nStarted: $localDateAndTime\n");

$targetFile = "/etc/aliases.shadow";
$iy=1;
open (theTargetFile, "$targetFile");
open (commTargetFile, "$targetFile");

 &initFiles;
 &culCommunityCheck;
 &culStaffCheck;
 @unique = uniq( @myGlobalArray );
 foreach $elementItem (@unique){
	print "User=$iy >> $elementItem\n";
	$iy++;
 	checkThisEmailAddress($elementItem);
 }
  system("date");                                
 &writeCul;
 print ("\nI'm exiting the code");
 $localDateAndTime =`date`;
 print ("\ncompleted: $localDateAndTime\n");
 exit; 
#################### end of main ##########################

sub initFiles {
  system("ssh -i /root/.ssh/litosys0_rsa litosys0\@newcunix.columbia.edu /bin/cp /dev/null /u/10/l/litosys0/culstatus.txt");
 }


sub uniq {
  my %seen;
  return grep { !$seen{$_}++ } @_;
}


sub writeCul {
  $alltheanswers = `scp -i /root/.ssh/litosys0_rsa litosys0\@newcunix.columbia.edu:/u/10/l/litosys0/culstatus.txt /opt/provisioning/culstatus.txt`;
  system("/bin/chmod 755 /opt/provisioning/culstatus.txt ");
  system("/bin/cat /opt/provisioning/culstatus.txt");

  system("/usr/bin/mutt -s \"Understand That this is the list of emails that failed\" pat2149\@columbia.edu < /opt/provisioning/culstatus.txt");
  system("/usr/bin/mutt -s \"Understand That this is the list of emails that failed\" sysadmin\@library.columbia.edu < /opt/provisioning/culstatus.txt");
}


sub culStaffCheck{

   while(<theTargetFile>){
                $b=$_;
                next if /^[ \t]*$/;
                next if /^#/;
                next if /#/;
                # this is looking for the cul-staff and expand things
                splitPrintCulStaff($b) if /^cul-from-cunix:/;
  }
close(theTargetFile);
}

sub culCommunityCheck{

	while(<commTargetFile>){
                $a=$_;
                next if /^[ \t]*$/;
                next if /^#/;
                next if /#/;
		# this is looking for the cul-community and it needs to read this line
                splitPrintCulCommunity($a) if /^cul-community-dist:/;
}
 close(commTargetFile);
}


sub splitPrintCulStaff {
   my ($splitTheseUp) = @_;
   ($toss_cul_from_cunix, $staffListaThruZ) = split /:/, $splitTheseUp;
   @getStringRightStaff = split /,/, $staffListaThruZ;
    foreach $seek_val (@getStringRightStaff){
         open (innerLoopStaff, "$targetFile") or die "We just could not open the file again\n ";
         while(<innerLoopStaff>){
             $sentence = $_;     # this is a line that is read from the alias file
             chomp($sentence);
             if ($sentence =~ /^$seek_val:/) {     # this is where you need to clear this up
             ($tossAwayValue, $getJustLines) = split( /:/, $sentence);
             @getTheLines = split( /,/, $getJustLines);
             	foreach $singleEmailAddressStaff (@getTheLines){
                  	# print "set = $singleEmailAddressStaff\n";
				push(@myGlobalArray, $singleEmailAddressStaff);
                 		# checkThisEmailAddress($singleEmailAddressStaff);
             }  #End foreach set
          } # end if seek_val
                       # exit;  because I don't want to go thur the whole thing now
         } #End while
         close(innerLoopStaff);
          #  &writeCul;
          # exit;    # this will stop for the first set that is "a"  exit;
   } #End foreach loop
} #end the sub routine


sub splitPrintCulCommunity {
   my ($splitTheseUp) = @_;
    ($throwaway, $parsegroups) = split /:/, $splitTheseUp;
    @getitright = split /,/, $parsegroups;
    foreach $needfulValue (@getitright){
     print "$needfulValue\n";

        open (innerLoopComm, "$targetFile");
        while(<innerLoopComm>){
        $sentence = $_;
        if ($sentence =~ /^$needfulValue:/) {     # this is where you need to clear this up
              ($tossAwayValue, $getJustLines) = split( /:/, $sentence); 
               @getTheLines = split( /,/, $getJustLines); 
       		foreach $singleEmailAddressCulComm (@getTheLines){
				push(@myGlobalArray, $singleEmailAddressCulComm);
			        # checkThisEmailAddress($singleEmailAddressCulComm);
			   }
      	}
                       # exit; # because I don't want to go thur the whole thing now
        } #End while
        close(innerLoopComm);

   } #End foreach loop
} #end the sub routine

sub checkThisEmailAddress{
   	my ($userEmail) = @_;
        # print "check $userEmail\n";
   	next if $userEmail !~ /\@columbia.edu/;
	$userEmail =~ s/columbia.edu/send/g;
   	system("sleep 2");
         $anscheck = `ssh -i /root/.ssh/litosys0_rsa litosys0\@newcunix.columbia.edu /u/10/l/litosys0/expna $userEmail 2>&1 /dev/null`;
       # $anscheck = `ssh -i /root/.ssh/litosys0_rsa litosys0\@newcunix.columbia.edu /u/10/l/litosys0/expnb.bash $userEmail 2>&1 /dev/null`;
}
