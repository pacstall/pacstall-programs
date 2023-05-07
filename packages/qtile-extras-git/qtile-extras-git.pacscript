name="qtile-extras-git"
pkgname="qtile-extras"
url="https://github.com/elParaguayo/qtile-extras.git"
license="MIT"
description="It is a list of mods developed by elParaguayo for Qtile"
pacdeps=("qtile-git")
maintainer="Ruturajn <nanotiruturaj@gmail.com>"
pkgver() {
  sudo mkdir tempcount && sudo chown "${PACSTALL_USER}" tempcount && cd tempcount && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b main . && git log --format=%ct.%h && sudo rm -r ../tempcount && cd ..
}
version="$(pkgver)"

install() {
  sudo python3 setup.py install --root="${pkgdir}"
}
