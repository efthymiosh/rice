#!/bin/bash

INPUTISO="$1"
OUTPUTDEV="$2" #not partition.

sudo dd if="$INPUTISO" of="$OUTPUTDEV" oflag=direct bs=1048576
