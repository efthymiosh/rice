#!/bin/bash

LINES=`tput lines`
LINES=$((LINES - 1))
COLS=`tput cols`
COLS=$((COLS + 8))

clear
cat	<(git --no-pager log --color=always --decorate -n1 --abbrev-commit | awk '{print ". " $0}')\
    	<(git --no-pager log --color=always --oneline --decorate --graph | tail -n +2) | head -n $LINES
#    	<(git --no-pager log --color=always --oneline --decorate --graph | tail -n +2) | fold -s -w $COLS | head -n $LINES
while inotifywait -r -e modify "./.git" &> /dev/null; do
	sleep 1
	clear
	cat	<(git --no-pager log --color=always --decorate -n1 --abbrev-commit | awk '{print ". " $0}')\
    		<(git --no-pager log --color=always --oneline --decorate --graph | tail -n +2) | head -n $LINES
#    		<(git --no-pager log --color=always --oneline --decorate --graph | tail -n +2) | fold -s -w $COLS | head -n $LINES
done
