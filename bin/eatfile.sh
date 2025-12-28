#!/bin/sh
filename=$1
if test -f $filename
then
/usr/local/bin/curl --silent -X POST http://192.168.21.1:8000/newscanfile -H "Content-Type: application/json" -d '{"file": "'${filename}'"}' | /usr/local/bin/jq
else
echo "not exist: $filename"
fi
