#!/bin/bash/ -x

echo "Enter the value of N and find Nth harmonic number" 
read num
NthHar=0
for ((	i=1;i<=$num;i++	))
do
	NthHar=$(echo "$NthHar" "$i" | awk '{print $1+(1/$2)}')
done
printf $NthHar
