#!/bin/bash

TOUCH_STATUS=$(synclient | grep TouchpadOff | awk '{print $3}')
TOUCH_STATUS=$((1 - $TOUCH_STATUS))
synclient "TouchpadOff=$TOUCH_STATUS"
