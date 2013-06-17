#!/bin/bash -x
# Copyright © 2013 Sébastien Luttringer

declare -a pids

killall() {
	[[ -n ${pids[*]} ]] && kill "${pids[@]}"
}

trap killall 0

for i in $(seq 1 ${1:-10000}); do
	sleep 365d &
	pids+=("$!")
done
echo 'Type Ctrl+C to kill all'
wait
