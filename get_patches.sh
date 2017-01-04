#!/bin/bash -x

[ -d patches ] || mkdir patches
I=0

cat arch_patches.txt | while read LINE
do
	echo $LINE
	COMMIT=$(echo $LINE | awk '{print $1}')
	git format-patch --stdout -1 $COMMIT > patches/$I-$COMMIT.patch
	I=$(($I+1))
done
