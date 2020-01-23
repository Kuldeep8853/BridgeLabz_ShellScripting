#!/bin/bash/
echo "Enter the co-ordinats x and y..."
read x
read y
distance=$( echo "$x" "$y" | awk '{print sqrt(($1*$1)+($2*$2))}')
printf "Distance between origin and co-ordinates x and y = $distance"
