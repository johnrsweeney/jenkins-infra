#!/bin/bash

#udo dnf install -y dnf-plugins-core
#udo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
#udo dnf install -y terraform

#udo dnf install -y epel-release
sudo apt install -y ansible

ansible-galaxy collection install community.docker ansible.posix community.general community.crypto
