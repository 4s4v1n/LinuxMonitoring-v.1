#!/bin/bash

. ./system_info.sh

output

echo -n "Do you wanna save info to a file? Y/N: "
read answer

if [ $answer == "Y" ] || [ $answer == "y" ]  
then
	filename=`date +"%d_%m_%Y_%H_%M_%S"`
	output>$filename.status
fi
