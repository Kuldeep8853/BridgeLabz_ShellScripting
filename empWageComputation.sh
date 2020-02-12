#!/bin/bash/
echo "Please Enter the choice: "
echo "1. Calculate the full time employee total wage..."
echo "2. Calculate the part time employee total wage..."
echo "3. Calculate the total wage of employee..."
read choice
case $choice in
1)
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
	echo "Full time work wage of the employee $fullTime$"
;;

2)
	echo "Add Part time Employee & wage"
	calculatePartTimeEmpWage(){
		PerDayHour=4
		WagePerHour=20
		EmpWage=$(( $WagePerHour*$PerDayHour ))
	echo $EmpWage
	}
	EmpPartTimeWage=$( calculatePartTimeEmpWage )
	echo "Part time working wage of the employee $EmpPartTimeWage $"
;;

3)
	totalWage=$(( $fullTime+$EmpPartTimeWage ))
 	echo "Total Employee wage $totalWage $"
;;

*)
	echo "Enter the valid choice!! "
 esac
