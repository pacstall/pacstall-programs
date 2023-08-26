name="cutefish-icons-git"
gives="cutefish-icons"
pkgver="0.8"
url="https://github.com/cutefishos/icons.git"
license="GPL-3.0"
makedepends=("extra-cmake-modules" "ninja-build")
pkgdesc="System default icon theme of CutefishOS."
pkgver() {
  git ls-remote "${url}" main | cut -f1 | cut -c1-8
}

prepare() {
  mkdir build
}

build() {
  cd build
  cmake ..
  make -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
}
