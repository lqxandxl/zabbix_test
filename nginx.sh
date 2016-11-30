#!/bin/bash
# Script to fetch nginx statuses for tribily monitoring systems
# Author: krish@toonheart.com
# License: GPLv2
# Set Variables
BKUP_DATE=`/bin/date +%Y%m%d`
LOG="/data/log/zabbix/webstatus.log"
HOST=127.0.0.1
PORT=9080
#echo "finish initial"
# Functions to return nginx stats
function active {
/usr/bin/curl "http://$HOST:$PORT/nginx-status" 2>/dev/null| grep 'Active' | awk '{print $NF}'
}
function reading {
/usr/bin/curl "http://$HOST:$PORT/nginx-status" 2>/dev/null| grep 'Reading' | awk '{print $2}'
}
function writing {
/usr/bin/curl "http://$HOST:$PORT/nginx-status" 2>/dev/null| grep 'Writing' | awk '{print $4}'
}
function waiting {
/usr/bin/curl "http://$HOST:$PORT/nginx-status" 2>/dev/null| grep 'Waiting' | awk '{print $6}'
}
function accepts {
/usr/bin/curl "http://127.0.0.1:9080/nginx-status" 2>/dev/null| awk NR==3 | awk '{print $1}'
}
function handled {
/usr/bin/curl "http://$HOST:$PORT/nginx-status" 2>/dev/null| awk NR==3 | awk '{print $2}'
}
function requests {
/usr/bin/curl "http://$HOST:$PORT/nginx-status" 2>/dev/null| awk NR==3 | awk '{print $3}'
}

#echo "finish all"
