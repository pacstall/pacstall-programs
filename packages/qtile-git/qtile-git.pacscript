name="qtile-git"
pkgname="qtile"
url="https://github.com/qtile/qtile.git"
license="MIT"
depends="python3-cffi xserver-xorg python3-xcffib python3-cairocffi libpangocairo-1.0-0 python3-pip python3-dbus libpulse-dev pavucontrol"
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
  pip install --upgrade --no-cache --force-reinstall cairocffi
  pip3 install dbus-next
  pip3 install .
  sudo python3 setup.py install
  sudo mkdir -p /usr/src/pacstall/qtile-git
  sudo cp -r ../qtile /usr/src/pacstall/qtile-git
}

postinst() {
  sudo touch /usr/share/xsessions/qtile.desktop
  echo "[Desktop Entry]
             Name=Qtile
             Comment=Qtile Session
             Exec=qtile start
             Type=Application
             Keywords=wm;tiling" | sudo tee -a /usr/share/xsessions/qtile.desktop > /dev/null
}
