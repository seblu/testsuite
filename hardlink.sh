#!/bin/bash
# Copyright © 2013 Sébastien Luttringer

default=${0##*/}
default=${default%.*}
dir=${1:-$default}

[[ -d $dir ]] || mkdir -p "$dir"

cd "$dir"

# 65000 seems to be the max hardlink by directory in ext4
n=65000

while sleep 1; do
	echo 'Ctrl+C to interupt'
	echo "remove hardlinks"
	rm -f v*
	echo "Creating $n hardlinks"
	echo 'I love povies' > v0
	for i in $(seq 1 $n); do
		(( $i % 10000 == 0 )) && echo "$i"
		ln v0 v$i
	done
done
