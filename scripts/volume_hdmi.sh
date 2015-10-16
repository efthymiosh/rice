#!/bin/bash

pacmd set-sink-volume 7 $(expr 655 '*' $1)
