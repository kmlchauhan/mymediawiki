#!/bin/bash

## Static Input Number
NUM=$1

a=0
b=1

echo "Fibonacci Series is - "

for (( i=0; i<NUM; i++ ))
do
    echo -n "$a "
    fibo=$(( a + b ))
    a=$b
    b=$fibo
done

#0 1 1 2 3 5 8 13 21 34 .......
