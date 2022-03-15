#!/bin/bash
while read -r line; do
	echo 'Dewiring: ' $line '...'
	pw-link -d $line
done < <(pw-cli dump short link| grep -Eo '^[0-9]+')
