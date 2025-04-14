#!/bin/bash

#created by

echo -n "Enter first number "
read num1

echo -n "Enter second number "
read num2

echo -n "Enter the operation +,-,*,/: "
read op

if [ "$op" = "+" ]; then
        result=$(( num1 + num2 ))

   elif [ "$op" = "-" ]; then
        result=$(( num1 - num2 ))

   elif [ "$op" = "*" ]; then
        result=$(( num1 * num2 ))

   else
        result=$(( num1 / num2 ))
fi
echo "$num1 $op $num2 = $result"
#END
