#!/bin/bash

if ! which ansible > /dev/null; then
    sudo apt update
    sudo apt install -y software-properties-common
    sudo add-apt-repository --yes --update ppa:ansible/ansible
    sudo apt install ansible
fi

LAPTOP=$1
SCRIPT_DIR=$(dirname ${BASH_SOURCE[0]})
PLAYBOOKS=$(ls ${SCRIPT_DIR}/ansible/*.yml | sed 's/^.*\/\(.\+\)\.yml$/\1/')
if [ -z "$LAPTOP" ] || [[ ! "${PLAYBOOKS}" =~ "$LAPTOP" ]]; then
    logger --stderr -- "Playbook must be one of: $PLAYBOOKS"
    exit
fi

shift
ansible-playbook --ask-become-pass ansible/${LAPTOP}.yml --diff $@
