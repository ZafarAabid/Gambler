#!/bin/bash 

echo "----------GamblerGame----------"

read -p "Enter how many days you want to play" days
read -p "how many Games in day ? " games
declare -A stakelist
dayss
stakes=0;

for((day=1; day <= $days; day++))
do
	stake=100;
	
	for((game=1; game <= $games; game++))
	do
	stake=$(($stake-1))
	echo $stake	
	done



stakes=$(($stakes+$stake))

done
