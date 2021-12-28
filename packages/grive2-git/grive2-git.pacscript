name="grive2-git"
pkgname="grive2"
pkgdir="${STOWDIR}/${name}"
description="Google Drive client with support for new Drive REST API and partial sync"
url="https://github.com/vitalif/grive2.git"
build_depends="cmake libgcrypt20-dev libyajl-dev libboost-all-dev libcurl4-openssl-dev libexpat1-dev libcppunit-dev binutils-dev debhelper zlib1g-dev dpkg-dev pkg-config"
depends="libgcrypt20 libyajl2 libboost-all-dev libcurl4 libexpat1"
replace="grive"
breaks="${pkgname}"
maintainer="KwonNam Son <kwon37xi@gmail.com>"

pkgver() {
  git ls-remote "${url}" master | cut -f1
}
version="$(pkgver)"

prepare() {
  mkdir build
  cd build || exit
}

build() {
  cmake ..
  make -j"$(nproc)"
}

install() {
  cd build || exit
  sudo make install DESTDIR="${pkgdir}"
  ls -lah "${pkgdir}"
  sleep 5
}
# vim:set ft=sh ts=2 sw=2 et:
