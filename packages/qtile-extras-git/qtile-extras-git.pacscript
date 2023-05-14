name="qtile-extras-git"
pkgname="qtile-extras"
url="https://github.com/elParaguayo/qtile-extras.git"
license="MIT"
description="It is a list of mods developed by elParaguayo for Qtile"
pacdeps=("qtile-git")
maintainer="Ruturajn <nanotiruturaj@gmail.com>"
pkgver() {
  mkdir /tmp/count/ && cd /tmp/count && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b main . && git log --format=%ct.%h && rm -r /tmp/count/
}
version="$(pkgver)"

install() {
  sudo python3 setup.py install --root="${pkgdir}"
}
