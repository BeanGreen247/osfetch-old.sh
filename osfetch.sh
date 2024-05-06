#!/bin/bash
# rewrite to make faster is planned
#vars
OS_PRETTY_NAME=$(cat /etc/os-release | grep PRETTY_NAME | cut -d "=" -f 2 | tr -d '"')
KERNEL_VERSION=$(cat /proc/version | awk {'print $3'})
SYSTEM_UPTIME=$(awk '{printf("Days:%d Hours:%02d Minutes:%02d Seconds:%02d\n",($1/60/60/24),($1/60/60%24),($1/60%60),($1%60))}' /proc/uptime)
CPU_NAME=$(grep -m 1 'model name' /proc/cpuinfo | cut -c 14-)
CPU_CORES=$(grep -c 'model name' /proc/cpuinfo)
GPU_NAME=$(lspci  -v | grep VGA | cut -c 36-)
MEMORY_TOTAL=$(awk '$3=="kB"{$2=$2/1000;$3="MiB"} 1' /proc/meminfo | column -t | grep MemTotal | awk {'print $2'} | cut -f1 -d".")
MEMORY_FREE=$(awk '$3=="kB"{$2=$2/1000;$3="MiB"} 1' /proc/meminfo | column -t | grep MemFree | awk {'print $2'} | cut -f1 -d".")
MEMORY_CACHED=$(awk '$3=="kB"{$2=$2/1000;$3="MiB"} 1' /proc/meminfo | column -t | grep -w "Cached" | awk {'print $2'} | cut -f1 -d".")
MEMORY_AVAILABLE=$(awk '$3=="kB"{$2=$2/1000;$3="MiB"} 1' /proc/meminfo | column -t | grep MemAvailable | awk {'print $2'} | cut -f1 -d".")
#output
echo "Os:" $OS_PRETTY_NAME
echo "Kernel:" $KERNEL_VERSION
echo "Uptime:" $SYSTEM_UPTIME
echo "CPU:" $CPU_NAME "($CPU_CORES)"
echo "GPU:" $GPU_NAME &
echo "Memory:" $(expr $(($MEMORY_TOTAL)) - $(($MEMORY_AVAILABLE)))"MiB/"$MEMORY_TOTAL"MiB"
echo "Cached Memory:" $MEMORY_CACHED"MiB"
echo "Available Memory:" $MEMORY_AVAILABLE"MiB"
