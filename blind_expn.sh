# !/usr/bin/bash


function cleanup {

     temp_file=/tmp/$$
echo "Im running the clean up part"
# make a temp file
# start writting failed email accounts into this file
}



function runmain {
while read p
do
{    echo "${p}"
     an_answer=`ssh -n cunix.cc.columbia.edu /opt/local/bin/expn ${p} 2>&1`
     if [[ "$an_answer" == 252* ]]
     then
     echo "Please check ${p}"
     echo "This is the problem $an_answer"
     # you need to set a flag here this flag will only be triggered when the program enters in this area
     # this also means that an email will be sent
     # if this flag does not equal true then nothing will be sent.

     # you need send an email at the bottom if there is fault

     fi
     sleep 5
} done < "/Users/pat2149/blarn"
}


function ifflagedemail {
 echo "if flaged email "
 echo " the temp file is $temp_file"
  #if flag is set then run and mail of the temp_file

 # so here is where I would send out an email to aleart

}



cleanup

# runmain

ifflagedemail
