#!/bin/bash 

#Prompt user input 
echo "Enter first number:"
read num1

echo "Enter second number:" 
read num2

#Perform calculations
sum=$(( num1 + num2 ))
difference=$(( num1 - num2 ))
product=$(( num1 * num2))

#Check for division by zero
if ((num2 == 0 )); then 
   echo "Cannot be divided by zero"
else 
   quotient=$(( num1 / num2 ))
fi 

#Display results
echo "Results:"
echo " $num1 + $num2 = $sum"
echo "$num1 - $num2 = $difference"
echo "$num1 * $num2 = $product"
echo "$num1 / $num2 = $quotient"