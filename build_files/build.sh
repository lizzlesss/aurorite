#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

dnf install -y \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

dnf config-manager enable \
    terra \
    terra-extras

dnf install -y \
    dmemcg-booster \
    kcgroups-dmemcg \
    mangohud \
    scx-scheds \
    scx-tools \
    steam \
    terra-gamescope

systemctl enable podman.socket
