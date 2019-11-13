#!/bin/bash 

echo "----------GamblerGame----------"

read -p "Enter how many days you want to play" days
read -p "how many Games in day ? " games
declare -A stakelist
dayss=0;
stakes=0;
win=1;

function gamble()
{
	bet=$(( RANDOM % 2 ))
	if [ $bet -eq $win ]
		then
		stake=$(( $stake + 1 ))
		else
		stake=$(( $stake - 1 ))
	fi
}

for((day=1; day <= $days; day++))
do
	echo "---day" $day "---"
	stake=100;
	
	for((game=1; game <= $games; game++))
	do
	gamble $stake
	echo $stake	
	done


stakes=$(($stakes+$stake))
# COMPUTING ALL DAYS FINAL STAKES INTO A DICTIONARY
#stakelist[$((dayss++))]=$stake
done
#echo ${stakelist[@]}




