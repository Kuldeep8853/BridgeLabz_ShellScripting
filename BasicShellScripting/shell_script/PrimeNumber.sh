#!/bin/bash/
echo "Enter the number"
read n
i=2
	(( d= $n / 2 ))
	while	[ $i -lt $d ]
	do
		if	[ $(( $n % $i )) -eq 0 ]
		then
			echo "$n is not a prime number."
			exit
		fi
		(( i=i+1 ))
	done
	echo "$n is prime number."
