name="bpytop-git"
pkgname="bpytop"
url="https://github.com/aristocratos/${pkgname}.git"
build_depends="make"
depends="python3 python3-pip python3-distutils"
description="Linux/OSX/FreeBSD resource monitor."
hash="9ee4aff7dd84b5475401793b925530c3cfad15c9bb3b4b73c9e875daf919d66c"

pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}
version="$(pkgver)"

prepare() {
  sudo pip3 install --upgrade psutil
}

install() {
  sudo make install DESTDIR="${pkgdir}"
  sudo install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  sudo install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

removescript() {
  sudo rm -rf "/usr/share/licenses/${pkgname}"
  sudo rm -rf "/usr/share/doc/${pkgname}"
}
