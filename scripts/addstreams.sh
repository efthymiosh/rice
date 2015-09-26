#!/bin/bash

ls ~/Music/streams/*.m3u 2> /dev/null | while read STREAM
do
    mpc add "$(cat $STREAM)"
done

