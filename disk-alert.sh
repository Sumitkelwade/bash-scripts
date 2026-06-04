#!/bin/bash

THRESHOLD=80

echo "=============================="
echo "      DISK USAGE ALERT        "
echo "=============================="

df -h | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{print $5 " " $1}' | while read output; do
    usage=$(echo $output | awk '{print $1}' | cut -d'%' -f1)
    partition=$(echo $output | awk '{print $2}')

    if [ $usage -ge $THRESHOLD ]; then
        echo "WARNING: $partition is ${usage}% full!"
    else
        echo "OK: $partition is ${usage}% used"
    fi
done

echo "=============================="
