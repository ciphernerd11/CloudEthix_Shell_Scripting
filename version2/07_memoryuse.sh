#!/bin/bash

REPORT="system_report.txt"

HOSTNAME=$(hostname)
DATE=$(date)

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8"%"}')

MEM_TOTAL=$(free -m | awk '/Mem:/ {print $2}')
MEM_USED=$(free -m | awk '/Mem:/ {print $3}')
MEM_USAGE=$(free | awk '/Mem:/ {printf("%.2f"), $3/$2 * 100.0}')

DISK_USAGE=$(df -h --total | grep 'total' | awk '{print $5}')

{
    echo "System Resource Report"
    echo "Hostname      : $HOSTNAME"
    echo "Date & Time   : $DATE"
    echo "CPU Usage     : $CPU_USAGE"
    echo "Memory Used   : $MEM_USED MB / $MEM_TOTAL MB ($MEM_USAGE%)"
    echo "Disk Usage    : $DISK_USAGE"
    echo 
    echo "Report saved to: $(pwd)/$REPORT"
} > "$REPORT"

echo "System resource report generated: $REPORT"
