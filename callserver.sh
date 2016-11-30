#! /bin/bash
a=$(top -b -n 1 |grep CallServer|awk '{print $6}');
b=$(echo ${a%m});
echo $b;

// use at /usr/local/zabbix/scripts
