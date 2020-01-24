#!/bin/bash/ -x
echo "Enter the array size."
read size
declare -a Array
echo "Enter the array elements."
for (( i=1;i<=size;i++ ))
do
	read Array[$i]
done
for ((i=1;i<=size;i++ ))
do
	printf "${Array[$i]} "
done
echo "Triplates "
for (( i=1;i<=$(( $size-2 ));i++ ))
do
	for (( j=$(( $i+1 ));j<=$(( $size-1 ));j++ ))
	do
		for ((k=$(( $j+1 ));k<=$size;k++ ))
		do
			if(( ${Array[$i]}+${Array[$j]}+${Array[$k]} == 0  ))
			then
				printf "${Array[$i]} ${Array[$j]} ${Array[$k]} \n"
			fi
		done
	done
done
