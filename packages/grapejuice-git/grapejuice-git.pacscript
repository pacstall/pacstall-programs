name="grapejuice-git"
description="A simple wine+roblox management application"
depends="git python3-pip python3-setuptools python3-wheel python3-dev pkg-config libcairo2-dev gtk-update-icon-cache desktop-file-utils xdg-utils libgirepository1.0-dev gir1.2-gtk-3.0"
url="https://gitlab.com/brinkervii/grapejuice.git"
maintainer="TwilightBlood <hwengerstickel@pm.me>"
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
  export PYTHONPATH="$(pwd)/src"
  python3 -m grapejuice_packaging linux_package || python -m grapejuice_packaging linux_package
  cd dist/linux_package
  sudo mkdir -p $STOWDIR/$name
  sudo tar -xf ./*.tar.gz -C /usr/src/pacstall/grapejuice-git/
}

# vim:set ft=sh ts=2 sw=2 et:
