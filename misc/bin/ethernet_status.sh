#!/bin/bash
 
echo "%{F#2495e7}󰈀  %{F#ffffff}$(/usr/bin/ip address | grep "ens33" | grep "inet " | awk '{print $2}' | cut -d '/' -f1)%{u-}"
