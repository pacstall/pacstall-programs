pkgname="grive2"
gives="grive2"
pkgdesc="Google Drive client with support for new Drive REST API and partial sync"
arch=("any")
pkgver="0.5.3"
source=("@${pkgname}~${pkgver}::https://github.com/vitalif/grive2/archive/v${pkgver}.tar.gz")
makedepends=(cmake pkg-config zlib1g-dev "libcurl4-openssl-dev | libcurl4-gnutls-dev" libboost-filesystem-dev libboost-program-options-dev libboost-test-dev libboost-regex-dev libexpat1-dev libgcrypt-dev libyajl-dev)
replaces=("grive")
sha256sums=("4cb67c32e94749353e08ce5fefb831fefa3e7b49b863329489a84804df11449d")
maintainer=("KwonNam Son <kwon37xi@gmail.com>")

build() {
  cd "${pkgname}~${pkgver}"
  mkdir build
  cd build
  cmake ..
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  cd build
  make install DESTDIR="${pkgdir}"
}
