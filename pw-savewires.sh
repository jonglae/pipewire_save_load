#!/bin/bash

if [[ "$#" -ne 1 ]]; then
	echo
	echo 'usage: pw-savewires filename'
	echo
	exit 0
fi

rm $1 &> /dev/null
while IFS= read -r line; do
	link_on=`echo $line | cut -f 4 -d '"'`
	link_op=`echo $line | cut -f 6 -d '"'`
	link_in=`echo $line | cut -f 8 -d '"'`
	link_ip=`echo $line | cut -f 10 -d '"'`
	echo "Saving: " "'"$link_on:$link_op"','"$link_in:$link_ip"'"
	echo "'"$link_on:$link_op"','"$link_in:$link_ip"'" >> $1
done < <(pw-cli dump short link)
