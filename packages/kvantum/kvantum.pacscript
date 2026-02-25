pkgname="kvantum"
arch=("any")
pkgver="1.1.6"
source=("@${pkgname}~${pkgver}::https://github.com/tsujan/Kvantum/releases/download/V${pkgver}/Kvantum-${pkgver}.tar.xz")
makedepends=("g++" "cmake" "libx11-dev" "qt6-base-dev>=6.6.0" "qt6-svg-dev" "libkf5windowsystem-dev" "libxext-dev")
breaks=("qt5-style-kvantum")
pkgdesc="SVG-based theme engine for Qt"
incompatible=('debian:bullseye')
sha256sums=("018df6bf93924c5af55c927998f096f8c70845a2f6031f5e0fcc95edb336674b")

build() {
  cd "${pkgname}~${pkgver}"
  cd Kvantum
  mkdir build && cd build
  cmake ..
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  cd Kvantum/build
  make install DESTDIR="${pkgdir}"
}
