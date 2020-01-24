#!/bin/bash/
echo "Enter the start time HH MM SS and stop time HH MM SS"
read sHH
read sMM
read sSS
read stHH
read stMM
read stSs
if(( (sHH<=23&sHH>=0) & (sMM>=0&smm<60) & (sSS>=0&sSS<60) & (stHH>=0&stHH<24) & (stMM>=0&stMM<60) & (stSS>=0&stSS<60) ))
then
	echo "Convert in second starting time"
	totalTime1=$(( (sHH*3600)+(sMM*60)+sSS ))
		echo $totalTime1
	echo "Convert in second ending time"
	totalTime2=$(( (stHH*3600)+(stMM*60)+stSS ))
		echo $totalTime2
else
	echo "Enter the correct time formate."
fi
diffTime=$(( $totalTime2-$totalTime1 ))
eHH=$(( $diffTime/3600 ))
eMM=$(( ($diffTime%3600)/60 ))
eSS=$(( ($diffTime%3600)%60 ))
echo "$eHH:$eMM:$eSS"
