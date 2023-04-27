#!/bin/sh

IFACE=$(/usr/bin/ip address | grep tun0 | awk 'NR<2{print $2}' | cut -d ':' -f1)

if grep -q "tun0" <<< $IFACE; then
	echo "%{F#1bbf3e}󰆧 %{F#ffffff}$(/usr/bin/ip a | grep tun0 | awk 'NR>1{print $2}' | cut -d '/' -f1)${u-}"
else
	echo "%{F#1bbf3e}󱐝 %{u-} Disconnected"
fi
