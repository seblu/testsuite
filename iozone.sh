#!/bin/bash -x
# Copyright © 2013 Sébastien Luttringer

default=${0##*/}
default=${default%.*}
dir=${1:-$default}

[[ -d $dir ]] || mkdir -p "$dir"

cd "$dir"

while sleep 1; do
	iozone -a
done
