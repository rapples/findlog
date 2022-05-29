#!/bin/bash
#echo "var1: $1 is the exploit they’re trying to find, for example icon, phpmyadmin, log4”
#echo "clearing old"
echo "" > output.txt
echo "" > process.sh
#echo 'creating process.sh'
grep "$1" /var/log/apache2/*.log  |awk  '{print $1}' | sed 's/.*:/whois /' |sed 's/$/ \>\> output.txt /'|grep ">>" |sort  > process.sh
#echo "executing process.sh"   # (could also include)
sh process.sh
echo 'output: '
grep 'ountry' output.txt | awk -F '\t' '{print $1}' | tr A-Z a-z |sort | uniq -c | sort -nr
#echo 'end.'
