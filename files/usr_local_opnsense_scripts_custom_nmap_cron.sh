#!/bin/sh
logdir=/var/log/exampy
filename=$(date "+%Y-%m-%d_%H:%M:%S").log
/usr/local/bin/nmap -sn -n -PR -oG ${logdir}/${filename} 192.168.21.0/24 
/usr/local/bin/curl -X POST http://localhost:8000/newscanfile -H "Content-Type: application/json" -d '{"file": "'${filename}'"}'