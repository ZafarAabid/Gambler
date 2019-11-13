#!/bin/bash 

echo "----------GamblerGame----------"

read -p "Enter how many days you want to play " days
echo ""
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

function limitedGames()
{
	read -p "how many Games in day ? " games
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

}

function calculativeGame()
{
	for((day=1; day <= $days; day++))
	do
		echo "---day" $day "---"
		stake=100;
		daywiseStake=$stake;
		leastLimit=$(( $daywiseStake/2 ))
		mostLimit=$(( $daywiseStake + $(( $daywiseStake/2 )) ))	
		while [[ $stake > $leastLimit ]] || [[ $stake < $mostLimit ]]
		do
			if [[ $stake > $leastLimit ]] || [[ $stake < $mostLimit ]]
				then
				gamble
				echo $stake
			else
				break
			fi
		done		
	done	
}
echo "Here is a two way to play"
echo "1)limited play    -- having player defined rounds to play"
echo "2)daff play       -- gameplay to either loos or win"
read -p "Which one you wanna play 1/2" condition

case $condition in
			1)
			limitedGames;;
			2)
			calculativeGame;;
			*)
			echo "wrong choice... daff game start"
			limitedGames;;
esac
#echo ${stakelist[@]}




