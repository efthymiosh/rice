#!/bin/bash

LINES=$((`tput lines` - 1))
COLS=`tput cols`
COLS=$((`tput cols` + 8))

clear
cat	<(git --no-pager log --all --color=always --decorate -n1 --abbrev-commit | awk '{print ". " $0}' | fold -s -w $COLS)\
    <(git --no-pager log --all --color=always --oneline --decorate --graph | tail -n +2) | fold -s -w $COLS | head -n $LINES
while inotifywait -r -e modify "./.git" &> /dev/null; do
	sleep 1
	clear
	cat	<(git --no-pager log --all --color=always --decorate -n1 --abbrev-commit | awk '{print ". " $0}' | fold -s -w $COLS)\
        <(git --no-pager log --all --color=always --oneline --decorate --graph | tail -n +2) | fold -s -w $COLS | head -n $LINES
done
