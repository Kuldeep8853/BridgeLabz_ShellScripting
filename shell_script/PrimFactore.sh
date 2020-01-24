#!/bin/bash/
prime_factore()
{
	num=$1
	while [ $(( $num%2 )) -eq 0	]
	do
		num=$(( num/2 ))
		echo "2 "
	done
	s=$(echo "$num" | awk '{print sqrt($num)}')
	for(( i=3;i<=$(( $num/2 ));i=$((i+2)) ))
	do
		while [ $(( $num%$i )) -eq 0 ]
		do
			printf "$i "
			num=$(( num/2 ))
		done
	done
}

echo "Enter the number and find the prime factores "
read n
prime_factore $n

