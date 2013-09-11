#!/bin/bash
# Copyright © 2013 Sébastien Luttringer

declare -a pids
declare -i count

count="$1"

if (( $count == 0 )); then
	echo "usage: ${0##*/} number_of_pid" >&2
	exit 1
fi

killall() {
	[[ -n ${pids[*]} ]] && kill "${pids[@]}"
}

trap killall 0

for i in $(seq 1 $c $count); do
	sleep 365d &
	pids+=("$!")
	printf "%d " $!
done
echo
echo 'Type Ctrl+C to kill all'
wait
