#!/bin/bash
#set -x
set -eu
set -o pipefail

# 20180719: Broke (failed to connect to docker) on the "stop" of the rm after 46
COUNTER=0
while true;  do
	for item in d6git d7git d8git; do
		COUNTER=$[$COUNTER +1]
		printf "\n\n$COUNTER: $item $(date)\n"
		cd ~/workspace/$item
		ddev import-db --src=.tarballs/$item.sql.gz; 
		ddev rm -R; 
		#ddev rm -R --omit-snapshot; 
	done
done
