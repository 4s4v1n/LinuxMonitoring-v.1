#!/bin/bash

. ../03/colors.sh
 
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

case $1 in
1) cb1=$white_back ;;
2) cb1=$red_back ;;
3) cb1=$green_back ;;
4) cb1=$blue_back ;;
5) cb1=$violet_back ;;
6) cb1=$black_back ;;
esac

case $2 in
1) cf1=$white_text ;;
2) cf1=$red_text ;;
3) cf1=$green_text ;;
4) cf1=$blue_text ;;
5) cf1=$violet_text ;;
6) cf1=$black_text ;;
esac

case $3 in
1) cb2=$white_back ;;
2) cb2=$red_back ;;
3) cb2=$green_back ;;
4) cb2=$blue_back ;;
5) cb2=$violet_back ;;
6) cb2=$black_back ;;
esac

case $4 in
1) cf2=$white_text ;;
2) cf2=$red_text ;;
3) cf2=$green_text ;;
4) cf2=$blue_text ;;
5) cf2=$violet_text ;;
6) cf2=$black_text ;;
esac

echo -e ""$cb1""$cf1"TIMEZONE        = "$cb2""$cf2"$timezone"$clear""  
echo -e ""$cb1""$cf1"USER            = "$cb2""$cf2"$user"$clear""
echo -e ""$cb1""$cf1"OS              = "$cb2""$cf2"$os"$clear""
echo -e ""$cb1""$cf1"DATE            = "$cb2""$cf2"$date"$clear""
echo -e ""$cb1""$cf1"UPTIME          = "$cb2""$cf2"$uptime"$clear""
echo -e ""$cb1""$cf1"UPTIME_SEC      = "$cb2""$cf2"$uptime_sec"$clear""
echo -e ""$cb1""$cf1"IP              = "$cb2""$cf2"$ip"$clear""
echo -e ""$cb1""$cf1"MASK            = "$cb2""$cf2"$mask"$clear""
echo -e ""$cb1""$cf1"GATEWAY         = "$cb2""$cf2"$gateway"$clear""
echo -e ""$cb1""$cf1"RAM_TOTAL       = "$cb2""$cf2"$ram_total Gb"$clear""
echo -e ""$cb1""$cf1"RAM_USED        = "$cb2""$cf2"$ram_used Gb"$clear""
echo -e ""$cb1""$cf1"RAM_FREE        = "$cb2""$cf2"$ram_free Gb"$clear""
echo -e ""$cb1""$cf1"SPACE_ROOT      = "$cb2""$cf2"$space_root Mb"$clear""
echo -e ""$cb1""$cf1"SPACE_ROOT_USED = "$cb2""$cf2"$space_root_used Mb"$clear""
echo -e ""$cb1""$cf1"SPACE_ROOT_FREE = "$cb2""$cf2"$space_root_free Mb"$clear""
}
