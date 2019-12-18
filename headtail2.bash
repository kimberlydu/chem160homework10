#!/bin/bash
intregex='^[0-9]+$'
count=$(wc $1| awk '{ print $1 }' )
if [ ! -f $1 ]; then
	echo "No file found"
	exit 1
elif ! [[ $2 =~ $intregex ]]; then
	echo "Second argument must be an integer"
	exit 1
elif [ $2 -gt $count ] || [ $3 -gt $count ]; then
	echo "File too short for specified lines"
	exit 1
elif [ $# -eq 3 ]; then
	echo "Head:"
	head -n $2 $1
	echo "Tail:"
	tail -n $3 $1
else
	echo "Head: "
	head -n $2 $1
	echo "Tail:"
	tail -n $2 $1
fi
