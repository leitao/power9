#!/bin/bash

[ -d patches ] || mkdir patches
I=10

cat arch_patches.txt | while read LINE
do
	COMMIT=$(echo $LINE | awk '{print $1}')

	# skip comments
	if [[ $COMMIT == \#* ]]
	then
		continue
	fi
	git show -s --pretty=oneline $COMMIT | cat
	I=$(($I+10))
done
