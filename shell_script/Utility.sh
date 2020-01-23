#!/bin/bash
Array()
{
	declare -a Array
	echo "enter the size of array"
	read size
	for (( i=1;i<=$size;i++ ))
	do
		Random=$RANDOM
		Array[$i]=$(( Random%10 ))
	done

	l=${#Array[@]}
	for(( i=1;i<=l;i++ ))
	do
		printf "${Array[${i}]} "
	done
}
Array
