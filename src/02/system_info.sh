#!/bin/bash

function output() {
hostname=`hostname`
timezone=`timedatectl | grep "Time zone" | sed 's/.*: //'`
user=`whoami`
os=`hostnamectl | grep "Operating System" | sed 's/.*: //'`
date=`date +"%d %B %Y %T"`
uptime=`uptime -p`
uptime_sec=`awk '{print $1}' /proc/uptime`
ip=`hostname -I | awk '{print $1}'`
mask=`netstat -ie | grep "$ip" | awk '{print $4}'`
gateway=`ip route | grep "default" | awk '{print $3}'`
ram_total=`free | grep "Mem" | awk '{printf "%.3f", ($2/1048576)}'`
ram_used=`free | grep "Mem" | awk '{printf "%.3f", ($3/1048576)}'`
ram_free=`free | grep "Mem" | awk '{printf "%.3f", ($4/1048576)}'`
space_root=`df -m | grep "/$" | awk '{printf "%.2f", $2}'`
space_root_used=`df -m | grep "/$" | awk '{printf "%.2f", $3}'`
space_root_free=`df -m | grep "/$" | awk '{printf "%.2f", $4}'`
echo "TIMEZONE = $timezone"
echo "USER = $user"
echo "OS = $os"
echo "DATE = $date"
echo "UPTIME = $uptime"
echo "UPTIME_SEC = $uptime_sec"
echo "IP = $ip"
echo "MASK = $mask"
echo "GATEWAY = $gateway"
echo "RAM_TOTAL = $ram_total Gb"
echo "RAM_USED = $ram_used Gb"
echo "RAM_FREE = $ram_free Gb"
echo "SPACE_ROOT = $space_root Mb"
echo "SPACE_ROOT_USED = $space_root_used Mb"
echo "SPACE_ROOT_FREE = $space_root_free Mb"
}
