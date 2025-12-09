#!/bin/sh
logdir=/var/log/exampy
filename=$(date "+%Y-%m-%d_%H:%M:%S").log
/usr/local/bin/nmap -sn -n -PR -oG - 192.168.54.0/24 > ${logdir}/${filename}
