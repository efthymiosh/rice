#!/bin/bash

if ! which ansible > /dev/null; then
    sudo apt update
    sudo apt install -y python3-pip
    python3 -m pip install --user ansible
fi

LAPTOP=$1
SCRIPT_DIR=$(dirname ${BASH_SOURCE[0]})
PLAYBOOKS=$(ls ${SCRIPT_DIR}/ansible/*.yml | sed 's/^.*\/\(.\+\)\.yml$/\1/')
if [ -z "$LAPTOP" ] || [[ ! "${PLAYBOOKS}" =~ "$LAPTOP" ]]; then
    logger --stderr -- "Playbook must be one of: $PLAYBOOKS"
    exit
fi

shift

cd "${SCRIPT_DIR}/ansible"

ansible-playbook --ask-become-pass ${LAPTOP}.yml --diff "$@"
