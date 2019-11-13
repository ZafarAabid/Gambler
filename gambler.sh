# /bin/bash -x

read -p "Enter the number of days" maxDays


declare stake
declare maximumloss
declare goal
declare fiftyPerc
declare enoughForToday=0
stakefinal=0
day=1
win=1
winCount=0
lossCount=0
win=0
loss=0
Days=20

function gamble(){  
   betResult=$((RANDOM%2))
	
	if [ $betResult == $win ]
	then
		win=$((win+1))
		stakefinal=$(($stakefinal+1))
	else
		loss=$((loss+1))
		stakefinal=$(($stakefinal-1))
	fi
}
function limitedGames() {
while [ $day -le $maxDays ]
do
	echo "day : "$day
	gameNum=0
	stake=10
	stakefinal=$(($stakefinal+$stake))
	fiftyPerc=$(( $(($stakefinal*50)) / 100 ))
	maximumloss=$(($stakefinal-$fiftyPerc))
	goal=$(($stakefinal+$fiftyPerc))
	echo "maxLimit: " $goal
	echo "minLimit: "$maximumloss
	echo "today's stake: "$stakefinal
	while :
	do
	if [ $stakefinal -ge $goal ]
	then
		echo "goal reached..... enough for today "
		enoughForToday=1
	elif [ $stakefinal -le $maximumloss ]
	then
		echo "lost too much money...enough for today"
		enoughForToday=1
	fi
		gamble
		gameNum=$(($gameNum+1))
		echo $stakefinal
		if [ $gameNum == $Days ]
		then
		echo "limit over"
			break
		elif [ $enoughForToday == 1 ]
		then
			enoughForToday=0
			break
		fi
	done
		day=$(($day+1))
		echo "stake at the end of the day : "$stakefinal
	if [ $(($day%20)) == 0 ]
	then
		analyzeTheGames
	fi
done
}
limitedGames
echo
	echo "total amount won in $day is $win........."
	echo "total amount lost in $day is $loss......." 
	echo "started with initial amount $stake and currently has $stakefinal"
