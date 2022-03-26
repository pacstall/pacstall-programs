name="qtile-git"
pkgname="qtile"
url="https://github.com/qtile/qtile.git"
license="MIT"
depends="python3-cffi xserver-xorg python3-xcffib python3-cairocffi libpangocairo-1.0-0 python3-pip python3-dbus libpulse-dev pavucontrol python3-testresources"
description="A full-featured, hackable tiling window manager written and configured in Python"
maintainer="Ruturajn <nanotiruturaj@gmail.com>"

pkgver() {
  git ls-remote "${url}" master | cut -f1
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
  sudo pip3 install dbus-next
  sudo mkdir -p /usr/src/pacstall/qtile-git/usr/share/xsessions
  sudo python3 setup.py install --root=/usr/src/pacstall/qtile-git/
  sudo cp ./resources/qtile.desktop /usr/src/pacstall/qtile-git/usr/share/xsessions/qtile.desktop
}
