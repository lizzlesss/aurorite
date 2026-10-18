#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

curl -fsSL https://raw.githubusercontent.com/terrapkg/packages/f$(rpm --eval '%{fedora}')/anda/terra/release/terra.repo | tee /etc/yum.repos.d/terra.repo
curl -fsSL https://raw.githubusercontent.com/terrapkg/packages/f$(rpm --eval '%{fedora}')/anda/terra/release/terra-extras.repo | tee /etc/yum.repos.d/terra-extras.repo
echo "priority=1" | tee -a /etc/yum.repos.d/terra.repo
echo "priority=1" | tee -a /etc/yum.repos.d/terra-extras.repo

dnf install -y \
    dmemcg-booster \
    kcgroups-dmemcg \
    mangohud \
    scx-scheds \
    scx-tools \
    steam \
    terra-gamescope

systemctl enable podman.socket
