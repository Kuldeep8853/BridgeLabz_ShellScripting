#!/bin/bash

echo "Tic Tac Toe"
echo "Enter the size of array"
read size
declare -A Board
CurrentPlayer="X"
intialboard="-"
IntialiseBoard(){
	size=$1
	for (( loop = 0 ; loop < $size ; loop++ ))
	do
		Board[$loop]="-"
	done
}

PrintBoard(){
	echo "Board Layout is "
	echo " -------------"
	for (( loop=0; loop < ${#Board[@]}; loop++ ))
	do
		if [ $loop -lt 3 ];
		then
			printf " | ${Board[$loop]}"
		elif [ $loop -lt  6 ];
		then
			if [ $loop -eq 3 ]
			then
				echo " |"
			fi
			printf " | ${Board[$loop]}"
		else
			if [ $loop -eq 6 ];
			then
				echo " |"
			fi
			printf " | ${Board[$loop]}"
		fi
	done
		echo " |"
      printf " -------------"
}

ChangePlayer(){
	if [ $CurrentPlayer == "X" ]
	then
		CurrentPlayer="O"
	else
		CurrentPlayer="X"
	fi
}

IsBoardFull(){
	for (( index=0; index<${#Board[@]};index++ ))
	do
		if [[ ${Board[$index]} == $intialboard ]]
		then
			return 1
		fi
	done
	return 0
}

checkRowCol(){
	charone=$1
	chartwo=$2
	charthree=$3
	if [[ ($charone != $intialboard) && ($chartwo == $charone) && ($charthree == $chartwo) ]]
	then
		return 0
	else
		return 1
	fi
}

CheckRows(){
	positonone=0
	positiontwo=1
	positionthree=2
	checkRowCol ${Board[$positionone]} ${Board[$positiontwo]} ${Board[$positionthree]}
	if [ $? -eq 1 ]
	then
		positionone=$(($positionone+3))
		positiontwo=$(($positiontwo+3))
		positionthree=$(($positionthree+3))
		checkRowCol ${Board[$positionone]} ${Board[$positiontwo]} ${Board[$positionthree]}
		if [ $? -eq 1 ]
		then
			positonone=$(($positionone+3))
			positiontwo=$(($positiontwo+3))
			positionthree=$(($positionthree+3))
			checkRowCol ${Board[$positionone]} ${Board[$positiontwo]} ${Board[$positionthree]}
			if [ $? -eq 1 ]
			then
				return 1
			else
				return 0
			fi
		else
			return 0
		fi
	else
		return 0
	fi
}

CheckColumns(){
	positionone=0
	positiontwo=3
	positionthree=6
	checkRowCol ${Board[$positionone]} ${Board[$positiontwo]} ${Board[$positionthree]}
	if [ $? -eq 1 ]
	then
		positionone=$(($positionone+1))
		positiontwo=$(($positiontwo+1))
		positionthree=$(($positionthree+1))
		checkRowCol ${Board[$positionone]} ${Board[$positiontwo]} ${Board[$positionthree]}
		if [ $? -eq 1 ]
		then
			positionone=$(($positionone+1))
			positiontwo=$(($positiontwo+1))
			positionthree=$(($positionthree+1))
			checkRowCol ${Board[$positionone]} ${Board[$positiontwo]} ${Board[$positionthree]}
			if [ $? -eq 1 ]
			then
				return 1
			else
				return 0
			fi
		else
			return 0
		fi
	else
		return 0
	fi
}

CheckDiagonals(){
	checkRowCol ${Board[0]} ${Board[4]} ${Board[8]}
	if [ $? -eq 1 ]
	then
		checkRowCol ${Board[2]} ${Board[4]} ${Board[6]}
		if [ $? -eq 1 ]
		then
			return 1
		else
			return 0
		fi
	else
		return 0
	fi
}

IsWinner() {
	CheckRows
	if [ $? -eq 1 ]
	then
		CheckColumns
		if [ $? -eq 1 ]
		then
			CheckDiagonals
			if [ $? -eq 1 ]
			then
				return 1
			else
			return 0
			fi
		else
			return 0
		fi
	else
		return 0
	fi
}

Placemark(){
	position=$1
	if [[ (( $position -ge 0 )) && (( $position -lt ${#Board[@]} )) ]]
	then
		if [ ${Board[${position}]}  == "-" ]
		then
			Board[$position]=$CurrentPlayer
			return 1
		else
			return 0
		fi
	else
		echo "Enter the position should be 0<position<9"
	fi
}

IntialiseBoard $size
	istrue=0
	until [ $istrue -eq 1 ]
	do
		IsBoardFull
		boardfull=$?
		IsWinner
		winner=$?
		if [[ ($boardfull -eq 1) && ($winner -eq 1) ]]
		then
			istrue=0
		else
			((istrue++))
		fi
		if [[ ($boardfull -eq 1) || ($winnner -eq 1) ]]
		then
			PrintBoard
			echo
			IsBoardFull
			if [ $? -eq 1 ]
			then
				echo "board is not full"
			else
				echo "board is full"
			fi
			IsWinner
			if [ $? -eq 1 ]
			then
				echo "player hasn't won"
			else
				echo "player has won"
				break
			fi
			echo
			mark=0
			until [ $mark -eq 1 ]
			do
				echo "player $currentPlayer place the mark at empty position"
				echo "enter the empty position to insert"
					read position
					Placemark $position
					if [ $? -eq 1 ]
					then
						ChangePlayer
						((mark++))
					else
						mark=0
					fi
			done
		fi
	done
