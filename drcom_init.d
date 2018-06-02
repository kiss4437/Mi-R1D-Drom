#!/bin/sh /etc/rc.common
# Copyright (C) 2006-2011 OpenWrt.org


. /lib/functions.sh
. /lib/functions/network.sh

START=25

start() {
    service_start /usr/Drcom/drcom -m dhcp -c /usr/Drcom/drcom.conf -d -e
	echo "程序已经启动"
}

stop() {
    service_stop /usr/Drcom/drcom
	echo "程序已经停止"
}

restart() {
    stop && start
}


#/etc/init.d/drcom start
#/etc/init.d/drcom enable
#/etc/init.d/network 本文件注释第29行setup_switch
