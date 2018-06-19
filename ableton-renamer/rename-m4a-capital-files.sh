#!/bin/bash

#
# with code from:
# https://serverfault.com/questions/5685/renaming-files-in-linux-with-a-regex
# https://serverfault.com/a/326361
# https://serverfault.com/questions/5685/renaming-files-in-linux-with-a-regex/326361#326361
# 


for myfile in ./*/*; do
	target=$(echo $myfile|sed -e 's/\.m4A/\.m4a/g')
	mv "$myfile" "$target"
	#echo original $myfile
	#echo new $target
done
