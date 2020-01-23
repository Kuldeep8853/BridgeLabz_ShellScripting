#!/bin/bash/
echo "How many time toss the coin and find percentage of head and tail"
read num
head=0
random=$RANDOM
for ((i=1;i<=$num;i++))
do
	if	[	$(( random %= 2 )) -gt 0 ]
		then
			(( head= head + 1 ))
n=$(( $random %= 2 ))
echo "$n"
	fi
done
h=$(( $head * 100 / $num ))
tail=$(( $num - $head ))
t=$(( $tail * 100 / $num ))
echo "Percentage of head and tail: $h% and $t% "
