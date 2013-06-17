#!/bin/bash
# Copyright © 2013 Sébastien Luttringer

default=${0##*/}
default=${default%.*}
dir=${1:-$default}
n=1000000

[[ -d $dir ]] || mkdir -p "$dir"

cd "$dir"

free_space() {
	echo 'Freeing space'
	find . -maxdepth 1 -xdev -name 'v*' -delete
}

trap free_space 0

while sleep 1; do
	echo 'Ctrl+C to interupt'
	free_space
	echo "Creating $n files"
	for i in $(seq 1 $n); do
		echo $i > v$i
		(( $i % 100000 == 0 )) && echo
		(( $i % 10000 == 0 )) && echo -n "$i "
	done
done
