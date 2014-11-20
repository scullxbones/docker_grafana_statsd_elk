#!/bin/bash
COUNTER=0
RANGE=100
RANGE2=50
HOST=192.168.59.103

while [  $COUNTER -lt 10000 ]; do
	number=$RANDOM
	let "number %= $RANGE"

	cpu=$RANDOM
	let "cpu %= $RANGE"

	number2=$RANDOM
	let "number2 %= $RANGE2"


	echo $number
	echo The counter is $COUNTER
	let COUNTER=COUNTER+1
	echo "mymetric1:$number|ms" | nc -w 1 -u $HOST 8125
	echo "mymetric2:$number2|ms" | nc -w 1 -u $HOST 8125
	echo "cpu:$cpu|ms" | nc -w 1 -u $HOST 8125

	echo "mytimer.timer1:$number|ms" | nc -w 1 -u $HOST 8125
	echo "mytimer.timer2:$number2|ms" | nc -w 1 -u $HOST 8125
        echo "mytimer.timer3:30|ms" | nc -w 1 -u $HOST 8125

	if [ $(( $COUNTER % 10 )) -eq 0 ] ; then
		 echo "deploy:1|c" | nc -w 1 -u $HOST 8125
	fi
done
