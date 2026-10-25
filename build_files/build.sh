#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

dnf config-manager enable \
    terra

dnf install -y \
    dmemcg-booster \
    kcgroups-dmemcg \
    mangohud \
    scx-scheds \
    scx-tools \
    terra-release-extras

dnf config-manager enable \
    terra-extras

dnf install -y \
    terra-gamescope

systemctl enable podman.socket
