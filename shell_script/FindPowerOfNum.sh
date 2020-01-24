#!/bin/bash/

echo "Enter the number and find the power of two"
read num
powerNum=1
for (( i=1;i<=$num;i++ ))
do
	(( powerNum = $powerNum*2 ))
done
echo "$num^2 = $powerNum"

