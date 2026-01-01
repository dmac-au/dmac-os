#!/bin/bash

set -ouex pipefail

### Install packages

# install basic packages
dnf5 install -y neovim podman distrobox fish

# install graphical packages
dnf5 install -y mate-polkit xwayland-satellite kitty nemo gnome-keyring pavucontrol

# Install niri from the yalter/niri COPR
dnf5 -y copr enable yalter/niri
dnf5 -y copr enable avengemedia/dms

dnf5 -y install niri dms dms-greeter

# disable coprs
dnf5 -y copr disable yalter/niri
dnf5 -y copr disable avengemedia/dms
