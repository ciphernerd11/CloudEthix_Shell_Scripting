#!/bin/bash

CMND="`df -h | grep -w '/' | awk '{print $5}' | cut -d '%' -f1`"

if (($CMND > 20));
then
    echo "Your disk usage $CMND and it has passed the threshold value"
else
    echo "Your disk usage is normal the current value is $CMND"
fi
