name="cutefish-wallpapers-git"
gives="cutefish-wallpapers"
pkgver="0.2-1"
source=("https://github.com/cutefishos/wallpapers.git")
pkgver="1.0"
license="GPL-3.0"
makedepends=("cmake" "ninja-build")
pkgdesc="CutefishOS's system wallpaper."

prepare() {
  mkdir build
  cd build
}

build() {
  cmake ..
  make -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
}
