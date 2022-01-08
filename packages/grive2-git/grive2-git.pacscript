name="grive2-git"
pkgname="grive2"
pkgdir="${STOWDIR}/${name}"
description="Google Drive client with support for new Drive REST API and partial sync"
url="https://github.com/vitalif/grive2.git"
build_depends="cmake libgcrypt20-dev libyajl-dev libboost-all-dev libcurl4-openssl-dev libexpat1-dev libcppunit-dev binutils-dev debhelper zlib1g-dev dpkg-dev pkg-config"
depends="libgcrypt20 libyajl2 libboost-all-dev libcurl4 libexpat1"
replace="grive"
breaks="${pkgname} ${pkgname}-bin ${pkgname}-deb ${pkgname}-app"
gives="grive2"
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
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        ..
  make -j"$(nproc)"
}

install() {
  sudo make install DESTDIR="${pkgdir}"
}
# vim:set ft=sh ts=2 sw=2 et:
