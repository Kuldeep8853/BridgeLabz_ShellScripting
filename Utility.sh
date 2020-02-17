#!/bin/bash/

echo "Employee present minimum 20 days in a month"
EmpPresent(){
	present=0
	for(( i=1;i<=30;i++ ))
	do
		num=$(( RANDOM%4 ))
		if(( num>0 ))
		then
			present=$(( $present+1 ))
		fi
	done
		echo "Employee $present days present and $(( 30-$present )) days absent in  a month"
	if(( $present < 20 ))
	then
		partTime=$(( 20-$present ))
		echo "Do the $(( $partTime*2 )) days Part Time and complete the 20 days in a month"
	fi
}
EmpPresent
