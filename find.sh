#!/bin/bash -x
# Copyright © 2013 Sébastien Luttringer

while sleep 1; do
	find / -ls &> /dev/null &
	find / -ls &> /dev/null &
	wait
done
