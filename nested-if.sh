#!/bin/bash 

age=19 
grade=75

if [ $age -gt 18 ]; then
  echo "You are elegible based on age."
    if [ $grade -ge 80 ] ; then
       echo "You are elegible based on grade"
       echo "Congrats! You are elegible for the scholarship!"
    else 
       echo "Sorry your grade is not high enough!"
    fi
else 
   echo "Sorry, you are not elegible!"
fi