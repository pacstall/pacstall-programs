name="kvantum"
pkgver="1.0.7"
url="https://github.com/tsujan/Kvantum/releases/download/V${pkgver}/Kvantum-${pkgver}.tar.xz"
makedepends=("g++" "cmake" "libx11-dev" "qtbase5-dev" "libqt5svg5-dev" "libqt5x11extras5-dev" "libkf5windowsystem-dev" "libxext-dev")
breaks=("qt5-style-kvantum")
pkgdesc="SVG-based theme engine for Qt"
incompatible=('debian:bullseye')
hash="43172e913ef4e275758092fbe76735ab5607182e344337a83a8c8ff616d79d7f"

build() {
  cd Kvantum
  mkdir build && cd build
  cmake ..
  make -j"$(nproc)"
}

package() {
  cd Kvantum/build
  sudo make install DESTDIR="${pkgdir}"
}
