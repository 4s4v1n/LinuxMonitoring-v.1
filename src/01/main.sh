#!/bin/bash
if ! [[ -z "$1" || $1 = [[:digit:]]* ]]; then
	echo "$1"
else 
	echo "Wrong input"
fi
