#!/bin/bash
PASS="xxxxxxx"
CMD=$@
while read domain;
do
VAR=$(expect -c "
spawn /home/vpopmail/bin/vadddomain $domain
match_max 100000
expect \"Please enter password for *:*\"
send -- \"$PASS\r\"
send -- \"\r\"
expect \"enter password again:*\"
send -- \"$PASS\r\"
send -- \"\r\"
expect eof
")
USR[0]=admin
USR[1]=hema
for i in ${USR[@]}
do
VAR1=$(expect -c "
spawn /home/vpopmail/bin/vadduser $i@$domain
match_max 100000
expect \"Please enter password for *:*\"
send -- \"$PASS\r\"
send -- \"\r\"
expect \"enter password again:*\"
send -- \"$PASS\r\"
send -- \"\r\"
expect eof
")
done
done < domain.txt
