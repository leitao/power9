#!/bin/bash -x

[ -d patches ] || mkdir patches
I=10

echo "       Current branch commit id           ->         Upstream commit id       "
for BACKPORT in `git log --pretty=oneline HEAD...da31bed5a4d89dc7e4d3b26c3f462d83cf4ae960 | awk '{print $1} '`
do
	echo -n $BACKPORT " -> "
 	ORIGINAL=`git show -s $BACKPORT | grep Commit-id | awk '{ print $2 }'`
	echo $ORIGINAL

	git show $BACKPORT > /tmp/a
	git --git-dir=/home/ubuntu/kernel/linux/.git show $ORIGINAL > /tmp/b

	vimdiff /tmp/a /tmp/b

	#read

done
