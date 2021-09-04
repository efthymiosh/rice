#!/bin/bash

if ! which ansible > /dev/null; then
    sudo apt update
    sudo apt install -y ansible
fi

ansible-playbook --ask-become-pass ansible/provision.yml --diff
