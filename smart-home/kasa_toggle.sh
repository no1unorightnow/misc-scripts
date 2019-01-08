#!/bin/bash

ADDRESS=$1

if [ "$1" = "" ]
	then
		echo 'Usage: ./kasa_toggle.sh <address/hostname>'
		exit
fi

STATE=`/opt/scripts/kasa/kasa_control.sh -i $ADDRESS status | grep relay_state | sed -e 's/ *//g' -e 's/"*//g' -e 's/,*//g' | cut -d: -f2`

if [ $STATE = "0" ]
	then
		/opt/scripts/kasa/kasa_control.sh -i $ADDRESS on
	elif [ $STATE = "1" ]
	then
		/opt/scripts/kasa/kasa_control.sh -i $ADDRESS off
	else
		echo ERROR
fi
