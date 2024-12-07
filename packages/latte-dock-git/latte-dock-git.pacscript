#!/bin/bash
# shellcheck disable=2034,2164
#  __      __________   ______
# /  \    /  \_____  \ /  __  \
# \   \/\/   //  ____/ >      <
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/
maintainer=("wizard-28 <wiz28@pm.me>")

pkgname="latte-dock-git"
gives="latte-dock"
pkgdesc="Replacement dock for Plasma desktops, providing an elegant and intuitive experience for your tasks and plasmoids"
source=("https://invent.kde.org/plasma/latte-dock.git")
arch=("any")
pkgver="0.10.8"
makedepends=("cmake" "extra-cmake-modules" "qtdeclarative5-dev" "libqt5x11extras5-dev" "libkf5iconthemes-dev" "libkf5plasma-dev" "libkf5windowsystem-dev" "libkf5declarative-dev" "libkf5xmlgui-dev" "libkf5activities-dev" "build-essential" "libxcb-util-dev" "libkf5wayland-dev" "git" "gettext" "libkf5archive-dev" "libkf5notifications-dev" "libxcb-util0-dev" "libsm-dev" "libkf5crash-dev" "libkf5newstuff-dev" "libxcb-shape0-dev" "libxcb-randr0-dev" "libx11-dev" "libx11-xcb-dev" "kirigami2-dev" "libwayland-dev" "libwayland-client0" "plasma-wayland-protocols" "libqt5waylandclient5-dev" "qtwayland5-dev-tools" "python3-pip" "plasma-workspace-dev")
depends=("plasma-workspace" "plasma-desktop")
breaks=("${gives}" "${gives}-bin")
incompatible=("debian:bullseye")

build() {
  cd "latte-dock"
  # Build rquired files
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Master ..
}

package() {
  cd "latte-dock"
  # Install awesome
  cd build/
  make install DESTDIR="${pkgdir}"
}
# vim:set ft=sh ts=2 sw=2 et:
