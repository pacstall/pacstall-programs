pkgname="kvantum"
arch=("any")
pkgver="1.1.5"
source=("@${pkgname}~${pkgver}::https://github.com/tsujan/Kvantum/releases/download/V${pkgver}/Kvantum-${pkgver}.tar.xz")
makedepends=("g++" "cmake" "libx11-dev" "qtbase5-dev" "libqt5svg5-dev" "libqt5x11extras5-dev" "libkf5windowsystem-dev" "libxext-dev")
breaks=("qt5-style-kvantum")
pkgdesc="SVG-based theme engine for Qt"
incompatible=('debian:bullseye')
sha256sums=("64af08988e8579ac8078b7db38a4986daa24d490ea6d54d70c08140a7737bc53")

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
