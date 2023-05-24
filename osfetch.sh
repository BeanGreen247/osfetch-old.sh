#!/bin/bash
#tempdata start
# preparing temp file for saving and reading temp data
# used for storing current cpu clock speed
tmpfile=$(mktemp /tmp/osfetch.XXXXXXXXXXX)
# create file descriptor 3 for writing to a temporary 
# file so that echo ... >&3 writes to that file
exec 3>"$tmpfile"
# create file descriptor 4 for reading from the same
# fileso that the file seek positions for reading
# and writing can be different
exec 4<"$tmpfile"
# writing data to file descriptor so that it can
# be accessed later
echo $(cat /proc/cpuinfo | grep -m 1 'cpu MHz' | awk {'print $4" "$2'}) >&3
#tempdata end
#vars
OS_PRETTY_NAME=$(cat /etc/os-release | grep PRETTY_NAME | cut -d "=" -f 2 | tr -d '"')
SYSTEM_HOSTNAME=$(cat /etc/hostname)
KERNEL_VERSION=$(cat /proc/version | awk {'print $3'})
SYSTEM_UPTIME=$(awk '{printf("Days:%d Hours:%02d Minutes:%02d Seconds:%02d\n",($1/60/60/24),($1/60/60%24),($1/60%60),($1%60))}' /proc/uptime)
NUMBER_OF_PACKAGES=$(dpkg-query -l | grep "^ii" | wc -l)
CPU_NAME=$(grep -m 1 'model name' /proc/cpuinfo | cut -c 14-)
CPU_CORES=$(grep -c 'model name' /proc/cpuinfo)
CPU_CLOCK_SPEED=$(awk '$2=="MHz"{$1=$1/1000;$2="GHz"} 1' <&4) # reading from temp file descriptor
GPU_NAME=$(lspci  -v | grep VGA | cut -c 36-)
MEMORY_TOTAL=$(awk '$3=="kB"{$2=$2/1000;$3="MiB"} 1' /proc/meminfo | column -t | grep MemTotal | awk {'print $2'} | cut -f1 -d".")
MEMORY_FREE=$(awk '$3=="kB"{$2=$2/1000;$3="MiB"} 1' /proc/meminfo | column -t | grep MemFree | awk {'print $2'} | cut -f1 -d".")
MEMORY_CACHED=$(awk '$3=="kB"{$2=$2/1000;$3="MiB"} 1' /proc/meminfo | column -t | grep -w "Cached" | awk {'print $2'} | cut -f1 -d".")
MEMORY_AVAILABLE=$(awk '$3=="kB"{$2=$2/1000;$3="MiB"} 1' /proc/meminfo | column -t | grep MemAvailable | awk {'print $2'} | cut -f1 -d".")
#output
echo "Os:" $OS_PRETTY_NAME
echo "Host Name:" $SYSTEM_HOSTNAME
echo "Kernel:" $KERNEL_VERSION
echo "Uptime:" $SYSTEM_UPTIME
echo "Packages:" $NUMBER_OF_PACKAGES
echo "CPU:" $CPU_NAME "($CPU_CORES)"
echo "CPU Current Clockspeed:" $CPU_CLOCK_SPEED
echo "GPU:" $GPU_NAME &
echo "Memory:" $(expr $(($MEMORY_TOTAL)) - $(($MEMORY_AVAILABLE)))"MiB/"$MEMORY_TOTAL"MiB"
echo "Cached Memory:" $MEMORY_CACHED"MiB"
echo "Available Memory:" $MEMORY_AVAILABLE"MiB"
# closing temp data descriptor
exec 3>&- 
# should be done on its own when script end
# used just to be sure
# removing temp file
rm "$tmpfile"
