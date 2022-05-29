name="qtile-git"
pkgname="qtile"
url="https://github.com/qtile/qtile.git"
license="MIT"
depends="python3-cffi xserver-xorg python3-xcffib python3-cairocffi libpangocairo-1.0-0 python3-pip python3-dbus libpulse-dev pavucontrol python3-testresources"
description="A full-featured, hackable tiling window manager written and configured in Python"
maintainer="Ruturajn <nanotiruturaj@gmail.com>"

pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}
version="$(pkgver)"

prepare() {
  true
}

build() {
  true
}

install() {
  sudo pip3 install --upgrade --no-cache --force-reinstall cairocffi cffi xcffib
  sudo pip3 install dbus-next setuptools-scm setuptools
  sudo mkdir -p "${STOWDIR}/${name}"/usr/share/xsessions
  sudo chown root:root ./
  sudo python3 setup.py install --root="${STOWDIR}/${name}"
  sudo cp ./resources/qtile.desktop "${STOWDIR}/${name}"/usr/share/xsessions/qtile.desktop
}

removescript() {
  sudo pip3 uninstall dbus-next setuptools-scm setuptools
}
