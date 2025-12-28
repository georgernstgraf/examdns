#!/bin/sh
logdir=/var/log/exampy
filename=$(date "+%Y-%m-%d_%H:%M:%S").log
exec 1>>${logdir}/scan_cron.log 2>&1
/root/bin/scan.py > ${logdir}/${filename}
echo "scan exited with code $? - stderr (if any) is above, now eat file"
/usr/local/bin/curl --silent -X POST http://192.168.21.1:8000/newscanfile -H "Content-Type: application/json" -d '{"file": "'${filename}'"}' | /usr/local/bin/jq
