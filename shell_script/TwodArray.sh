#!/bin/bash -x
printf "shell scripting "
num=$$
echo $num
declare -A array
echo	"Enter the row and column"
read row
read column
for ((i=0;i<row;i++))
do
	for ((j=0;j<column;j++))
	do
		array[$i,$j]=$((	$RANDOM%10	))
	done
done

for ((i=0;i<row;i++))
	do
		for ((j=0;j<column;j++))
		do
		printf "${array[$i,$j]} "
		done
	printf "\n"
done
