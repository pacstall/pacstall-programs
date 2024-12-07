pkgname="cutefish-wallpapers-git"
gives="cutefish-wallpapers"
source=("https://github.com/cutefishos/wallpapers.git")
arch=("any")
pkgver="1.0"
license="GPL-3.0"
makedepends=("cmake" "ninja-build")
pkgdesc="CutefishOS's system wallpaper."

prepare() {
  cd "wallpapers"
  mkdir build
  cd build
}

build() {
  cd "wallpapers"
  cmake ..
  make -j"${NCPU}"
}

package() {
  cd "wallpapers"
  make install DESTDIR="${pkgdir}"
}
