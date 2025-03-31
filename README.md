# Efthymios' laptop provisioning

This repo is what I use to setup my laptops and keep them up to date.
You're welcome to peruse and reuse. :)

The actual dotfiles are in the various ansible role directories.

## Getting started with a fresh installation

Ensure python and ansible are installed, and run:

```bash
ansible-playbook -K --diff ./${LAPTOP}.yml
```

## Firefox manual configuration

In `about:config` set:

```
layout.css.devPixelsPerPx = 1.25
services.sync.prefs.sync-seen.extensions.activeThemeID = false
sidebar.verticalTabs = true
```
