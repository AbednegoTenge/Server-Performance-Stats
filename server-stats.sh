#!/usr/bin/env bash

echo "Report Generated On: $(date '+%Y-%m-%d %H:%M:%S')"
echo
echo "-----Server Performance Stats-----"

echo
echo "____Memory and CPU Stats____"
top -bn1 | awk '
    /^%Cpu\(s\)/ { 
        cpu_usage = 100 - $8 
    } 
    /^MiB Mem :/ { 
        free_memory = $6
        used_memory = $8
    }
    END {
        print "Total Cpu Usage: " cpu_usage
        print "Free memory: " free_memory
        print "Used memory: " used_memory
    }'

echo
echo "____Disk Stats____"

df -h --total | awk '
    /^total/ {
        print "Total Disk: " $2
        print "Free Disk: " $4
        print "Used Disk: " $3
    }'

echo
echo ----Top 5 Process by CPU and Memory Usage----
ps aux --sort=-%cpu | head -n 6 | awk '{print $1 "\t" $3}'
echo
ps aux --sort=-%mem | head -n 6| awk '{print$1 "\t" $4}'
echo
