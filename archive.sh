#!/bin/bash
find /var/log -type f -name "*.log" -mtime +7 -exec gzip {} \;
echo "The log files from last 7 days has been compressed"
