#!/bin/bash

set -ouex pipefail

### Install packages

# install basic packages
dnf5 install -y neovim podman distrobox fish

# install graphical packages
dnf5 install -y mate-polkit xwayland-satellite kitty

# Install niri from the yalter/niri COPR
dnf5 -y copr enable yalter/niri
dnf5 -y copr enable avengemedia/dms

dnf5 -y install niri dms dms-greeter

# disable coprs
dnf5 -y copr disable yalter/niri
dnf5 -y copr disable avengemedia/dms

# install intune

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf5 config-manager addrepo --from-repofile https://packages.microsoft.com/yumrepos/microsoft-rhel9.0-prod
sudo dnf5 install intune-portal
