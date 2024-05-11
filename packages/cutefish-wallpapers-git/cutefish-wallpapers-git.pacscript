pkgname="cutefish-wallpapers-git"
gives="cutefish-wallpapers"
pkgver="0.2-1"
source=("https://github.com/cutefishos/wallpapers.git")
pkgver="1.0"
license="GPL-3.0"
makedepends=("cmake" "ninja-build")
pkgdesc="CutefishOS's system wallpaper."

prepare() {
  cd "${_archive}"
  mkdir build
  cd build
}

build() {
  cd "${_archive}"
  cmake ..
  make -j"${NCPU}"
}

package() {
  cd "${_archive}"
  make install DESTDIR="${pkgdir}"
}
