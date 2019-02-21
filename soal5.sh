#!/bin/bash

cat /var/log/syslog | grep -v "sudo" | grep -n "cron" | grep -i "cron" | awk '{print $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12}' >> ~/modul1/record.txt
