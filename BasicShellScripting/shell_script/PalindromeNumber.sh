#!/bin/bash/
echo "Enter the number"
read number
i=$number
r=0
rnumber=0
while [ $number -gt 0 ]
do
	r=$(( $number % 10 ))
	rnumber=$(( $rnumber * 10 + $r ))
	number=$(( $number / 10 ))
done
if	[ $i -eq $rnumber ]
	then
		echo "Its Palindrom number"
	else
		echo "Its not palindrom number"
fi
