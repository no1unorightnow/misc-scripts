#!/bin/bash


# When MultiTracks.com provides the "linked" files for their Ableton files, they are named wrong.
# They create them on Windows, which doesn't support case-sensitivity.
# If you're using Mac with a case-sensitive filesystem, this presents a large issue...
# 	the file links are all broken!
# This script renames them to fix that, since the
# 	multiTracks.com support team doesn't see this as an issue.


#ls -1

for myfile in ./*/*; do
	target=$(echo $myfile|sed -e 's/\.m4A/\.m4a/g')
	mv "$myfile" "$target"
	#echo original $myfile
	#echo new $target
done
