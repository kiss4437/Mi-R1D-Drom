#!/bin/sh /etc/rc.common
# Copyright (C) 2006-2011 OpenWrt.org


. /lib/functions.sh
. /lib/functions/network.sh

START=25

start() {
    service_start /usr/Drcom/drcom -m dhcp -c /usr/Drcom/drcom.conf -d -e
}

stop() {
    service_stop /usr/Drcom/drcom
}

restart() {
    stop && start
}


#/etc/init.d/drcom start
#/etc/init.d/drcom enable
