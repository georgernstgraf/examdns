#!/bin/sh
logdir=/var/log/exampy
filename=$(date "+%Y-%m-%d_%H:%M:%S").log
exec 1>>${logdir}/nmap_cron.log 2>&1
/usr/local/bin/nmap -sn -n -PO -PE -PP -PM -PR -oG ${logdir}/${filename} 192.168.21.0/24 > /dev/null
/usr/local/bin/curl --silent -X POST http://localhost:8000/newscanfile -H "Content-Type: application/json" -d '{"file": "'${filename}'"}' | /usr/local/bin/jq
