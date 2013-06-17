#!/bin/bash -x
# Copyright © 2013 Sébastien Luttringer

su -c 'pgbench -i' postgres
while sleep 1; do
	su -c 'pgbench -T 180' postgres
done
