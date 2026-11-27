#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

dnf remove -y \
    fish \
    zsh

dnf config-manager enable \
    fedora-multimedia \
    terra

dnf install -y \
    dmemcg-booster \
    kcgroups-dmemcg \
    mangohud \
    steam \
    terra-release-extras

dnf config-manager enable \
    terra-extras

dnf install -y \
    terra-gamescope \
    waydroid-nvidia

dnf copr enable -y sirlucjan/scx-scheds-cargo

dnf install -y \
    scx-scheds-git

dnf copr disable -y sirlucjan/scx-scheds-cargo

systemctl enable podman.socket
