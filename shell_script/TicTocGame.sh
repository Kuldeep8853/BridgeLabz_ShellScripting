#!/bin/bash/ 

declare -a board

initializetionBoard(){
	for(( i=1;i<=3;i++ ))
	do
		for(( j=1;j<=3;j++ ))
		do
			board[$i,$j]="."
		done
	done
}

printBoard(){
	echo "-------------"
	for(( i=1;i<=3;i++ ))
	do
		for(( j=1;j<=3;j++ ))
		do
			printf "| ${board[$i,$j]} "
		done
			printf "|\n"
			echo "-------------"
	done
}

IsBoardFull(){
	isFull=true
	for(( i=1;i<=3;i++ ))
	do
		for(( j=1;j<=3;j++ ))
		do
			if(( ${board[$i,$j]}=="." ))
			then
				isFull=false
			fi
		done
	done
	return isFull
}

FillBoard(){
 currentPlayer=x
	for(( i=1;i<=3;i++ ))
	do
		for(( j=1;j<=3;j++ ))
		do
			row=$(( ($RANDOM%3)+1 ))
			column=$(( ($RANDOM%3)+1 ))
			if(( ${board[${row},${column}]}=="." ))
			then
				board[$row,$column]=$currentPlayer
			return true
			fi
		done
	done
	return false
}

changePlayer(){
	if(( $currentPlayer==x ))
	then
		currentPlayer=0
	else
		currentPlayer=x
	fi
}

checkRowColumn(){
	read $1
	read $2
	read $3
		if(( $1!=. && $1==$2 && $2==$3 ))
		then
			return true
		fi
}

checkWinner(){
	return  checkRowWin || checkColumnWin || checkDiagonalWin 
}

checkRowWin(){
	for(( i=1;i<=3;i++ ))
	do
		if(( checkRowColumn ${board[$i,1]} ${board[$i,2]} ${board[$i,3]} ))
		then
			return true
		fi
	done
}

checkColumnWin(){
	for(( i=1;i<=3;i++ ))
	do
		if(( checkRowColumn ${board[1,$i]} ${board[2,$i]} ${board[3,$i]} ))
		then
			return true
		fi
	done
}

checkDiagonalWin(){
	if(( checkRowColumn ${board[1,1]} ${board[2,2]} ${board[3,3]} ))
	then
		return true
	else
	return checkRowColumn ${board[1,3]} ${board[2,2]} ${board[3,1]}
	fi
}

start(){
	if(( FillBoard ))
	then
		if(( !IsBoardFull ))
		then
			printBoard
			changePlayer
		fi
	fi
	printBoard
}

Winner(){
	if(( checkWinner ))
	then
		echo "We have win! "
		exit
	else if(( IsBoardFull ))
			then
				echo "Drow!"
			fi
	fi
}

#
#Starting point of the program
#
initializetionBoard
printBoard
start
Winner
