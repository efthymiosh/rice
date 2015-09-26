#!/bin/bash

if [[ `pidof "hhpc"` -ne 0 ]]; then
	killall hhpc
fi
~/scripts/source_hhpc/hhpc -i 2 &
