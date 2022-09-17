#!/usr/bin/env sh
echo 'Generating 12-character passwords'
for ((n=1;n<123;n++))
do pwd=`dd if=/dev/urandom count=1 2> /dev/null | uuencode -m - | sed -ne 2p | cut -c-12`
echo "smtp$n" "$pwd"
done
