#!/bin/bash 

echo "----------GamblerGame----------"

read -p "Enter how many days you want to play " days
echo ""
declare -A stakelist
counter=0;
stakeBrought=0;
stakegained=0;
win=1;
lastdayremaining=0;
maxLimitForToday=0;
minLimitForToday=0;
wincounter=0;
losscounter=0;

function gamble(){
	bet=$(( RANDOM % 2 ))
	if [ $bet -eq $win ]
		then
		stake=$(( $stake + 1 ))
		wincounter=$(($wincounter+1))
		else
		stake=$(( $stake - 1 ))
		losscounter=$(($losscounter+1))
	fi
}

function loosWinCondition(){
	if [ $stakeBrought -lt $stakegained ]
	then
	echo "-- We had won $" $(( $stakegained - $stakeBrought ))" --" 
	elif [ $stakeBrought -gt $stakegained ]
	then
	echo "Sorry... We had lost $" $(( $stakeBrought - $stakegained ))
	fi 
}

function limitedGames(){
read -p "how many Games in day ? " games
	for((day=1; day <= $days; day++))
	do
			echo "---day" $day "---"
			stake=10;
			lastdayremaining=$(( $lastdayremaining + $stake ))
			stakeBrought=$(($stakeBrought + $stake))
			stakegained=$(($stakegained+$lastdayremaining))
			stake=$lastdayremaining
			maxLimitForToday=$(( $stake + $(($stake/2)) ))
		echo "maxlimit--------"$maxLimitForToday
			minLimitForToday=$(( $stake/2 ))
		echo "minlimit--------"$minLimitForToday
			for((game=1; game <= $games; game++))
			do
			if [[ $stake < $maxLimitForToday ]] || [[ $stake > $minLimitForToday  ]]
			then
			gamble
			echo $stake
			
			else	break
			fi
lastdayremaining=$stake
			done
			stakelist[$((counter++))]=$stake
			echo "amount at the end of day" $stake	
	done

loosWinCondition	
}


limitedGames
echo "you have won the bet "$wincounter "times"
echo "you have lost the bet "$losscounter "times"
echo ${stakelist[@]}




