#!/bin/sh
#
# Description    : This will loop through an array and execute
#                  a function in parallel with a given N throttle.
#                  This syntax is specific to the sh shell, i.e.,
#                  a hypervisor running BusyBox will only have sh.
#                  This is a bit easier to do in the bash shell...
#
# Author         : Lucas McGlamery

task(){
   sleep 1
   echo "Executing task on: $1"
}

i=0
N=2
for thing in a b c d e f g
do
    if [ $(expr "$i" % "$N") -eq 0 ]
    then
       wait
    fi
    task "$thing" &
    let "i=i+1"
done