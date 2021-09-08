#  __      __________   ______  
# /  \    /  \_____  \ /  __  \ 
# \   \/\/   //  ____/ >      < 
#  \        //       \/   --   \
#   \__/\  / \_______ \______  /
#        \/          \/      \/ 
maintainer="wizard-28 <wiz28@pm.me>"

name="latte-dock-git"
pkgname="latte-dock"
pkgdir="${STOWDIR}/${name}"
description="Replacement dock for Plasma desktops, providing an elegant and intuitive experience for your tasks and plasmoids"
url="https://github.com/KDE/latte-dock.git"
build_depends="cmake extra-cmake-modules qtdeclarative5-dev libkf5iconthemes-dev libkf5plasma-dev libkf5declarative-dev libkf5xmlgui-dev libkf5activities-dev libkf5wayland-dev gettext libkf5archive-dev libkf5notifications-dev libkf5crash-dev libkf5newstuff-dev kirigami2-dev"
optdepends=("libkf5windowsystem-dev: X11 support"
            "libqt5x11extras5-dev: X11 support"
            "libxcb-util-dev: X11 support"
            "libxcb-randr0-dev: X11 support"
            "libxcb-shape0-dev: X11 support"
            "libx11-dev: X11 support"
            "libx11-xcb-dev: X11 support"
            "libsm-dev: X11 support")
breaks="${pkgname} ${pkgname}-bin"

pkgver() {
  git ls-remote "${url}" master | cut -f1 
}
version="$(pkgver)"

prepare() {
  sudo pip3 install --upgrade cmake
}

build() {
  # Build rquired files
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
         -DCMAKE_BUILD_TYPE=Master ..
}

install() {
  # Install awesome
  sudo make install DESTDIR="${pkgdir}"
}
# vim:set ft=sh ts=2 sw=2 et:
