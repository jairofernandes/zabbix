#!/bin/bash

HOSTNAME=$(hostname)
IPADDRESS=$(curl -s http://ifconfig.me/ip)
DATA=$(date)

#echo $HOSTNAME
#echo $IPADDRESS
#PTR=$(dig @8.8.8.8 +noall +answer a lnxsrvmx01.poleoduto.com.br |awk '{print $1}')
#REV=$(dig @8.8.8.8 +noall +answer -x 186.233.220.235 |awk '{print $5}')

PTR=$(dig @8.8.8.8 +noall +answer a $HOSTNAME |awk '{print $1}')
REV=$(dig @8.8.8.8 +noall +answer -x $IPADDRESS |awk '{print $5}')

if [ $PTR == $REV ]
then
        STATUS="0"
else
        STATUS="1"
fi

echo "$STATUS;$DATA;$PTR;$REV" >> /var/log/zabbix/postfix/reverso.log

echo "$STATUS"
