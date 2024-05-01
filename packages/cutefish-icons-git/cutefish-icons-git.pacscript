pkgname="cutefish-icons-git"
gives="cutefish-icons"
pkgver="0.8"
source=("https://github.com/cutefishos/icons.git")
license="GPL-3.0"
makedepends=("extra-cmake-modules" "ninja-build")
pkgdesc="System default icon theme of CutefishOS."

prepare() {
  cd "${_archive}"
  mkdir build
}

build() {
  cd "${_archive}"
  cd build
  cmake ..
  make -j"${NCPU}"
}

package() {
  cd "${_archive}"
  make install DESTDIR="${pkgdir}"
}
