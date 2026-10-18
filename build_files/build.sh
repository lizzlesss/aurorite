#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

dnf install -y \
    dmemcg-booster

systemctl enable podman.socket
