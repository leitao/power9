#!/bin/bash -x

[ -d patches ] || mkdir patches
I=10

rm -fr patches/*

cat arch_patches.txt | while read LINE
do
	echo $LINE
	COMMIT=$(echo $LINE | awk '{print $1}')

	# skip comments
	if [[ $COMMIT == \#* ]]
	then
		continue
	fi
	git format-patch --stdout -1 $COMMIT > patches/$I-$COMMIT.patch
	I=$(($I+10))
done
