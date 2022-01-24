#!/bin/bash

sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo dnf install -y terraform

sudo dnf install -y epel-release
sudo dnf install -y ansible

ansible-galaxy collection install community.docker ansible.posix community.general community.crypto
