# Efthymios' laptop provisioning

This repo is what I use to setup my laptops and keep them up to date.
You're welcome to peruse and reuse. :)

The actual dotfiles are in the various ansible role directories.

## Getting started with a fresh installation

Ensure python and ansible are installed, e.g:

```bash
sudo apt update
sudo apt install -y python3-pip
python3 -m pip install --user ansible
cd ansible
ansible-playbook -K --diff ./${LAPTOP}.yml
```
