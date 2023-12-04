name="grive2-git"
gives="grive2"
pkgdesc="Google Drive client with support for new Drive REST API and partial sync"
url="https://github.com/vitalif/grive2.git"
pkgver="0.5.3"
makedepends=("cmake" "libgcrypt20-dev" "libyajl-dev" "libboost-all-dev" "libcurl4-openssl-dev" "libexpat1-dev" "libcppunit-dev" "binutils-dev" "debhelper" "zlib1g-dev" "dpkg-dev" "pkg-config")
depends=("libgcrypt20" "libyajl2" "libboost-all-dev" "libcurl4" "libexpat1")
replace=("grive")
breaks=("${gives}" "${gives}-bin" "${gives}-deb" "${gives}-app")
maintainer="KwonNam Son <kwon37xi@gmail.com>"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

prepare() {
  mkdir build
  cd build || exit
}

build() {
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ..
  make -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
}
# vim:set ft=sh ts=2 sw=2 et:
