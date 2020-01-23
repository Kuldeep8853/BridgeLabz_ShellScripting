#!/bin/bash/
a=$(echo scale=2;100/3 |bc);echo $a
num=$(echo "sqrt ( 10 )" | bc -l);
echo $num
