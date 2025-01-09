pkgname="grive2"
gives="grive2"
pkgdesc="Google Drive client with support for new Drive REST API and partial sync"
arch=("any")
pkgver="0.5.1"
source=("@${pkgname}~${pkgver}::https://github.com/vitalif/grive2/archive/v${pkgver}.tar.gz")
makedepends=("cmake" "libgcrypt20-dev" "libyajl-dev" "libboost-all-dev" "libcurl4-openssl-dev" "libexpat1-dev" "libcppunit-dev" "binutils-dev" "debhelper" "zlib1g-dev" "dpkg-dev" "pkg-config")
depends=("libgcrypt20" "libyajl2" "libboost-all-dev" "libcurl4" "libexpat1")
replaces=("grive")
sha256sums=("9940bcd3e5a3ffd32b91477fba8ba1ca3e0a3a72e5ffa9c6d524db87951fdbbb")
patch=("https://github.com/vitalif/grive2/commit/b4d6ac055f8f16ac735a70036243bc4ea2334039.patch")
maintainer=("KwonNam Son <kwon37xi@gmail.com>")

prepare() {
  cd "${pkgname}~${pkgver}"
  patch -Np1 -i PACSTALL_patchesdir/b4d6ac055f8f16ac735a70036243bc4ea2334039.patch
}

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
