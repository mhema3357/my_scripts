#!/bin/bash
FILE="/var/log/mysql/mysqld.log"
while read line; do
    if [[ "$line" = *ERROR* ]]; then
     echo $line >> /tmp/mysql_error.txt;
fi
done < $FILE
words=`wc -l /tmp/mysql_error.txt | awk '{print $1}'`;
    if [ $words -gt 1 ]; then
     cp $FILE $FILE.`date +%F-%T`
     cat /tmp/mysql_error.txt | mail -s "MySQL Errors on $(hostname) Check MySQL server immediately - Notification" test@test.com
     >$FILE
     >/tmp/mysql_error.txt
fi
