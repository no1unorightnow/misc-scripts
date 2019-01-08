#!/bin/bash

# lives at: /opt/scripts/wemo/wemo_toggle.sh

ADDRESS=$1

if [ "$1" = "" ]
	then
		echo 'Usage: ./wemo_toggle.sh <address/hostname>'
		exit
fi

STATE=`/opt/scripts/wemo/wemo_control.sh $ADDRESS GETSTATE`

if [ $STATE = "OFF" ]
	then
		/opt/scripts/wemo/wemo_control.sh $ADDRESS ON
	elif [ $STATE = "ON" ]
	then
		/opt/scripts/wemo/wemo_control.sh $ADDRESS OFF
	else
		echo ERROR
fi
