pkgname="grive2-git"
gives="grive2"
pkgdesc="Google Drive client with support for new Drive REST API and partial sync"
source=("https://github.com/vitalif/grive2.git")
arch=("any")
pkgver="0.5.3"
makedepends=("cmake" "libgcrypt20-dev" "libyajl-dev" "libboost-all-dev" "libcurl4-openssl-dev" "libexpat1-dev" "libcppunit-dev" "binutils-dev" "debhelper" "zlib1g-dev" "dpkg-dev" "pkg-config")
depends=("libgcrypt20" "libyajl2" "libboost-all-dev" "libcurl4" "libexpat1")
replaces=("grive")
breaks=("${gives}" "${gives}-bin" "${gives}-deb" "${gives}-app")
maintainer=("KwonNam Son <kwon37xi@gmail.com>")

prepare() {
  cd "grive2"
  mkdir build
  cd build || exit
}

build() {
  cd "grive2"
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ..
  make -j"${NCPU}"
}

package() {
  cd "grive2"
  make install DESTDIR="${pkgdir}"
}
# vim:set ft=sh ts=2 sw=2 et:
