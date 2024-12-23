pkgname="kvantum"
arch=("any")
pkgver="1.0.10"
source=("@${pkgname}~${pkgver}::https://github.com/tsujan/Kvantum/releases/download/V${pkgver}/Kvantum-${pkgver}.tar.xz")
makedepends=("g++" "cmake" "libx11-dev" "qtbase5-dev" "libqt5svg5-dev" "libqt5x11extras5-dev" "libkf5windowsystem-dev" "libxext-dev")
breaks=("qt5-style-kvantum")
pkgdesc="SVG-based theme engine for Qt"
incompatible=('debian:bullseye')
sha256sums=("4a070a1a6fac3d1861010aa44d34e665e4697bc64c4c5015a6448203c31f1f1f")

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
