#!/bin/bash -x
# Copyright © 2013 Sébastien Luttringer

cleanup() {
	[[ -n $spid ]] && kill -9 $spid &>/dev/null
}

trap cleanup 0

iperf -s &>/dev/null &
spid=$!

while sleep 1; do
	iperf -c 127.0.0.1 -t -1 -i 1  "$@"
done
