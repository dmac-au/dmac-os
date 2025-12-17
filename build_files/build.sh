#!/bin/bash

set -ouex pipefail

### Install packages

# install basic packages
dnf5 install -y neovim

# install graphical packages
dnf5 install -y gdm mate-polkit xwayland-satellite
# Install niri from the yalter/niri COPR
dnf5 -y copr enable yalter/niri
dnf5 -y copr enable avengemedia/dms
dnf5 -y install niri dms dms-greeter
dnf5 -y copr disable yalter/niri
dnf5 -y copr disable avengemedia/dms

#### Example for enabling a System Unit File

systemctl enable podman.socket
