pkgname="kvantum"
arch=("any")
pkgver="1.1.8"
source=("@${pkgname}~${pkgver}::https://github.com/tsujan/Kvantum/releases/download/V${pkgver}/Kvantum-${pkgver}.tar.xz")
makedepends=("g++" "cmake" "libx11-dev" "qt6-base-dev>=6.6.0" "qt6-svg-dev" "libkf6windowsystem-dev" "libxext-dev")
breaks=("qt6-style-kvantum")
pkgdesc="SVG-based theme engine for Qt"
incompatible=('debian:bullseye')
sha256sums=("7aa9099345e48048ebdad768f583944ac042f87b216fa0b26a169c7e05425047")

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
