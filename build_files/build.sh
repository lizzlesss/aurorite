#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

curl -fsSL https://raw.githubusercontent.com/terrapkg/packages/f$(rpm --eval '%{fedora}')/anda/terra/release/terra.repo | tee /etc/yum.repos.d/terra.repo

dnf install -y \
    terra-release \
    terra-gpg-keys

systemctl enable podman.socket
