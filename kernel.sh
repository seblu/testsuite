#!/bin/bash -x
# Copyright © 2013 Sébastien Luttringer

default=${0##*/}
default=${default%.*}
dir=${1:-$default}

[[ -d $dir ]] || mkdir -p "$dir"

cd "$dir"

# download kernels
for v in {1..9}; do
	[[ -e linux-3.$v.tar.xz ]] && continue
	wget https://www.kernel.org/pub/linux/kernel/v3.x/linux-3.${v}.tar.xz
done

# initine untar loop
while true; do
	for i in *.tar.xz; do
		d=${i%.tar.xz}
		echo $d; [[ -e "$d" ]] && rm -r "$d"
		tar xf "$i"
	done
done
