#!/bin/bash

set -ouex pipefail

### Install packages

# install basic packages
dnf5 install -y neovim podman distrobox fish

# install graphical packages
dnf5 install -y mate-polkit xwayland-satellite kitty nemo

# Install niri from the yalter/niri COPR
dnf5 -y copr enable yalter/niri
dnf5 -y copr enable avengemedia/dms

dnf5 -y install niri dms dms-greeter

# disable coprs
dnf5 -y copr disable yalter/niri
dnf5 -y copr disable avengemedia/dms

# install intune

# install prerequisites
dnf5 -y install webkit2gtk4.1 gnome-keyring

# fuck with webkit2gtk4
ln -s /usr/lib64/libwebkit2gtk-4.1.so.37 /usr/lib64/libwebkit2gtk-4.0.so.37

# actually install it
rpm --import https://packages.microsoft.com/keys/microsoft.asc
dnf5 config-manager addrepo --from-repofile https://packages.microsoft.com/yumrepos/microsoft-rhel9.0-prod/config.repo
dnf5 -y install intune-portal
