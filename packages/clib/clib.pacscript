name=clib
version=2.7.0
description="C package manager-ish"
url="https://github.com/clibs/clib/archive/refs/tags/${version}.tar.gz"
depends="gcc libcurl4-gnutls-dev"
hash="99640506e1cf69d69451dc5d0db2d8fd169ff8247bda8c6d01dd66e9471ac6a0"
pkgdir="/usr/src/pacstall/${name}"
removescript="yes"

prepare () {
  true
}
build() {
  make
}

install() {
  sudo  make install DESTDIR="${pkgdir}" 
  sudo install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${name}"
}

removescript() {
  sudo rm -rf "/usr/share/licenses/${name}"
}
