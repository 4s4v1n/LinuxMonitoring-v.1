#!/bin/bash

. ./system_info.sh
. ./condition.sh

if [[ $# -eq 4 ]]; then
	cb1=$1
	cf1=$2
	cb2=$3
	cf2=$4
	check=`condition $cb1 $cf1 $cb2 $cf2`
	if [[ $check -eq  1 ]]; then
		output $cb1 $cf1 $cb2 $cf2
	elif [[ $check -eq 2 ]]; then
		echo "Back and font colours of names are equal"
		echo "Input parametrs again"
		read cb1 cf1 cb2 cf2
		./main.sh $cb1 $cf1 $cb2 $cf2
	elif [[ $check -eq 3 ]]; then
		echo "Back and font colours of values are equal"
		echo "Input parametrs again"
		read cb1 cf1 cb2 cf2
		./main.sh $cb1 $cf1 $cb2 $cf2
	else
		echo "There is no colours like that"
	fi	
else 
	echo "Wrong number of parametrs"
fi
