#!/bin/sh

WANIP=`ifconfig ppp0 | awk '$1=="inet" && $2!="127.0.0.1"{print $2}'`
if [ "$WANIP" = "" ]; then
	/usr/local/sbin/pfSctl -c 'interface reload wan'
	echo "reloaded WAN1"
else
	echo $WANIP
fi

OPT1IP=`ifconfig ppp1 | awk '$1=="inet" && $2!="127.0.0.1"{print $2}'`
if [ "$OPT1IP" = "" ]; then
	/usr/local/sbin/pfSctl -c 'interface reload opt1'
	echo "reloaded WAN2"
else
	echo $OPT1IP
fi

OPT2IP=`ifconfig ppp2 | awk '$1=="inet" && $2!="127.0.0.1"{print $2}'`
if [ "$OPT2IP" = "" ]; then
	/usr/local/sbin/pfSctl -c 'interface reload opt2'
	echo "reloaded WAN3"
else
	echo $OPT2IP
fi
