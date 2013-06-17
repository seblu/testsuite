#!/bin/bash -x
# Copyright © 2013 Sébastien Luttringer

default=${0##*/}
default=${default%.*}
dir=${1:-$default}

[[ -d $dir ]] || mkdir -p "$dir"

chown -R nobody:nobody "$dir"

while sleep 1; do
	bonnie++ -d "$dir" -u nobody:nobody;
done
