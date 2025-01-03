pkgname="rpi-imager"
pkgdesc="Raspberry pi Imaging Utility"
pkgver="1.9.0"
pkgrel=1
repology=("project: rpi-imager")
license=("Apache-2.0")
url="https://github.com/raspberrypi/rpi-imager"
arch=("arm64")
maintainer=("Sundaram Krishnan <krishnsundaram@gmail.com>")
depends=(
  'curl'
  'libgcc-s1'
  'libc6-dev'
  'hicolor-icon-theme'
  'libarchive-dev'
  'gnutls-dev'
  'openssl'
  'build-essential'
  'qt6-base-dev'
  'qt6-declarative-dev'
)

makedepends=(
  'cmake'
  'libgnutls28-dev'
  'qtcreator'
  'qt6-base-dev'
  'qt6-tools-dev'
  'qt6-svg-dev'
  'qt6-declarative-dev'
)
source=("https://github.com/raspberrypi/${pkgname}/archive/v${pkgver}.tar.gz")
b2sums=('d4eae0e1f1d99901938d04d1fcd6cb3dac84296172791f215247aa6873284e4b8d6673e0e847ad9dd41167cea87122a154a440a91bf8546a4a1d0442a02cb494')

build() {
  cmake -B build -S "${pkgname}-${pkgver}/src" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DENABLE_CHECK_VERSION=OFF \
    -DENABLE_VENDORING=OFF
  cmake --build build
}

package() {
  DESTDIR=${pkgdir} cmake --install build
  rm -rf "${pkgdir}"/usr/include/zstd_errors.h
}
