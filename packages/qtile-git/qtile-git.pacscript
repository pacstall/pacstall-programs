name="qtile-git"
pkgname="qtile"
url="https://github.com/qtile/qtile.git"
license="MIT"
depends=("python3-cffi" "xserver-xorg" "python3-xcffib" "python3-cairocffi" "libpangocairo-1.0-0" "python3-pip" "python3-dbus" "libpulse-dev" "pavucontrol" "python3-testresources")
description="A full-featured, hackable tiling window manager written and configured in Python"
maintainer="Ruturajn <nanotiruturaj@gmail.com>"

pkgver() {
  mkdir /tmp/count/ && cd /tmp/count && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master . && git log --format=%ct.%h && rm -r /tmp/count/
}
version="$(pkgver)"

install() {
  sudo pip3 install --upgrade --no-cache --force-reinstall cairocffi cffi xcffib
  sudo pip3 install dbus-next setuptools-scm setuptools
  sudo mkdir -p "${pkgdir}"/usr/share/xsessions
  sudo chown root:root ./
  sudo python3 setup.py install --root="${pkgdir}"
  sudo cp ./resources/qtile.desktop "${pkgdir}"/usr/share/xsessions/qtile.desktop
}

removescript() {
  sudo pip3 uninstall dbus-next setuptools-scm setuptools
}
