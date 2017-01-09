#!/bin/bash
MAX=${1:-1000}
echo $MAX

git reset --hard
function patch_file {
	echo -n "applying patch " $1 " : "

	patch -p1 < $1  > /dev/null

	if [ $? -eq 0 ]
	then
		echo OK
	else
		echo FAILED
	fi
}
	
## main

[ -d patches ] || exit "No patches/ directory"

FILES=$(find patches/ -maxdepth 1 -name \*patch | awk -F/ '{print $2}' | sort -h)

for mfile in $FILES
do
	I=$(echo $mfile | awk -F\- '{print $1}')

	if [ $I -lt $MAX ]
	then
		patch_file patches/$mfile 
	else
		echo skipping $mfile
	fi


done
