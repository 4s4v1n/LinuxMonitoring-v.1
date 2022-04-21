#!/bin/bash

if [[ $# -eq 1 ]];then
    if [[ -e $1 ]] && [[ -d $1 ]] && [[ "${1: -1}" == "/" ]];then
        . ./functions.sh
        start=`cat /proc/uptime | awk '{print $1}'`
        TotalNumberOfFolders $1
        Top5Folders $1
        TypeOfFiles $1
        Top10Files $1
        Top10ExecFiles $1
        end=`cat /proc/uptime | awk '{print $1}'`
        full_time=`echo $end - $start | bc`
        printf "Script execution time = %.1f\n" $full_time
    else
        echo "It's not a directory"
    fi
else
    echo "Wrong number of patametrs"
fi