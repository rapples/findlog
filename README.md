# findlog
linux script that searches the apache2 log for entries that include parameter 1 and determines the country of origin of that ip address


Finds country of IP used by those that are trying to hack you

For Linux, must be run with privileges that include access to log files.

Setup:
Create two files, findlog.sh and process.sh 

touch findlog.sh
touch process.sh
chmod +x findlog.sh
chmod +x process.sh



Insert the following code into findlog.sh 

vi findlog.sh

#!/bin/bash
#echo "var1: $1 is the exploit they’re trying to find, for example icon, phpmyadmin, log4”
#echo "clearing old"
echo "" > output.txt
echo "" > process.sh
#echo 'creating process.sh'
grep "$1" /var/log/apache2/*.log  |awk  '{print $1}' | sed 's/.*:/whois /' |sed 's/$/ \>\> output.txt /'|grep ">>" |sort  > process.sh
#echo "executing process.sh  # (could also include)
sh process.sh
echo 'output: '
grep 'ountry' output.txt | awk -F '\t' '{print $1}' | tr A-Z a-z |sort | uniq -c | sort -nr
#echo 'end.'

Save and exit

To execute:

./findlog.sh  icon      <= this is the exploit the bad guy is searching for

      5 country:        us
      3 country:        kz
      1 country:        ua
      1 country:        gb
      1 country:        eu # country is really world wide


