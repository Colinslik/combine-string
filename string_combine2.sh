#!/bin/sh

	echo "Shutting down QSync manitor: OK"
	pidnum=`/bin/pidof qsync``/bin/pidof qsyncd`
	kill $pidnum 2>/dev/null
	i=0
	while [ ${i} -lt 5 ]
	do
		pidnum=`/bin/pidof qsync``/bin/pidof qsyncd`
		if [ -z "$pidnum" ]; then
			break
		fi
		sleep 1
		i=`/usr/bin/expr ${i} + 1`
	done
	pidnum=`/bin/pidof qsync``/bin/pidof qsyncd`
	[ -z "$pidnum" ] || kill -9 $pidnum 2>/dev/null
	/sbin/daemon_mgr qsyncman stop "/usr/bin/qsyncman"
	/usr/bin/killall -q qsyncman
