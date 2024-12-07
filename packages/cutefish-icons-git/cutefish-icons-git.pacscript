pkgname="cutefish-icons-git"
gives="cutefish-icons"
arch=("any")
pkgver="0.8"
source=("https://github.com/cutefishos/icons.git")
license="GPL-3.0"
makedepends=("extra-cmake-modules" "ninja-build")
pkgdesc="System default icon theme of CutefishOS."

prepare() {
  cd "icons"
  mkdir build
}

build() {
  cd "icons"
  cd build
  cmake ..
  make -j"${NCPU}"
}

package() {
  cd "icons"
  make install DESTDIR="${pkgdir}"
}
