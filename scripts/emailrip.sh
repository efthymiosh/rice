#!/bin/bash

# Thunderbird email format ripper.

grep $1 -ie "from: .*di.uoa.gr" | awk -F"From: " '{print $2}' | sed 's/"//g' | sed 's/\t//g' | sort -u | while read MLINE
do
    ADDR=$(echo "$MLINE" | cut -d\< -f2 | cut -d\> -f1)
    FULLNAME=$(echo "$MLINE" | cut -d\< -f1)
    FIRSTNAME=$(echo "$FULLNAME" | cut -d\  -f1)
    LASTNAME=$(echo "$FULLNAME" | cut -d\  -f2)
    NICK=$(echo "$ADDR" | cut -d@ -f1)
    printf "$NICK\t$LASTNAME, $FIRSTNAME\t$FULLNAME <$ADDR>\n"
done
