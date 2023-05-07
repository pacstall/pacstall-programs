#!/bin/bash
# shellcheck disable=2034,2164
#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer="wizard-28 <wiz28@pm.me>"

name="latte-dock-git"
pkgname="latte-dock"
description="Replacement dock for Plasma desktops, providing an elegant and intuitive experience for your tasks and plasmoids"
url="https://invent.kde.org/plasma/latte-dock.git"
build_depends=("cmake" "extra-cmake-modules" "qtdeclarative5-dev" "libqt5x11extras5-dev" "libkf5iconthemes-dev" "libkf5plasma-dev" "libkf5windowsystem-dev" "libkf5declarative-dev" "libkf5xmlgui-dev" "libkf5activities-dev" "build-essential" "libxcb-util-dev" "libkf5wayland-dev" "git" "gettext" "libkf5archive-dev" "libkf5notifications-dev" "libxcb-util0-dev" "libsm-dev" "libkf5crash-dev" "libkf5newstuff-dev" "libxcb-shape0-dev" "libxcb-randr0-dev" "libx11-dev" "libx11-xcb-dev" "kirigami2-dev" "libwayland-dev" "libwayland-client0" "plasma-wayland-protocols" "libqt5waylandclient5-dev" "qtwayland5-dev-tools" "python3-pip" "plasma-workspace-dev")
depends=("plasma-workspace" "plasma-desktop")
breaks=("${pkgname}" "${pkgname}-bin")
incompatible=("debian:bullseye")

pkgver() {
  sudo mkdir tempcount && sudo chown "${PACSTALL_USER}" tempcount && cd tempcount && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master . && git log --format=%ct.%h && sudo rm -r ../tempcount && cd ..
}
version="$(pkgver)"

build() {
  # Build rquired files
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Master ..
}

install() {
  # Install awesome
  cd build/
  sudo make install DESTDIR="${pkgdir}"
}
# vim:set ft=sh ts=2 sw=2 et:
