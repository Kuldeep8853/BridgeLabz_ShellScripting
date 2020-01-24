#!/bin/bash/ -x
echo "Enter the stack, goal and Num "
read stack
read goal
read Num
bets=0
win=0
for(( i=1;i<=$Num;i++ ))
	do
		cash=$stack
		while(( $cash>0 & $cash<$goal ))
			do
				bets=$(( $bets+1 ))
				r=$(( $RANDOM%2 ))
				if(( $r<1 ))
					then
						cash=$(( $cash+1 ))
				else
					cash=$(( $cash-1 ))
				fi
		done
			if(( $cash==$goal ))
				then
					win=$(( $win+1 ))
			fi
done
printf "$win win of $Num"
