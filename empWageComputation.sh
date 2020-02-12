#!/bin/bash/ -x

echo "Calculate Daily Employee wage"
calculateEmpWage(){
		TotalWage=0
		WagePerHour=20
		DailyWage=$(( $WagePerHour*8 ))
		for(( i=1;i<=20;i++ ))
		do
			n=$(( RANDOM%5 ))
			if(( n>0 ))
			then
				TotalWage=$(( $TotalWage+$DailyWage ))
			fi
		done
		echo "$TotalWage "
}
fullTime=$( calculateEmpWage )

echo "Add Part time Employee & wage"
calculatePartTimeEmpWage(){
		PerDayHour=4
		WagePerHour=20
		EmpWage=$(( $WagePerHour*$PerDayHour ))
	echo $EmpWage
}
EmpPartTimeWage=$( calculatePartTimeEmpWage )

echo "Total working of the month 20 days and 150 hour"
totalWageOfMonth=$(( 150*20 ))
if(( $fullTime < $totalWageOfMonth ))
then
	RemainingWage=$(( $totalWageOfMonth-$fullTime ))
fi
remainingHour=$(( $RemainingWage/20 ))
echo "Remaining hour of the month $remainingHour and complete remaining hour doing part time work"
partTimeDays=$(( $remainingHour/4 ))
echo " do the $partTimeDays days part time and complete the remaining hour" 
