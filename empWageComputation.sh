#!/bin/bash/

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

echo "Please Enter the how many days part time work: "
read partTime
 for(( i=1;i<=partTime;i++ ))
	do
	partTimeWage=$(( $partTimeWage+$EmpPartTimeWage ))
 done
totalWageOfMonth=$(( $fullTime+$partTimeWage ))
echo "Total Wage of the the month is $totalWageOfMonth"
