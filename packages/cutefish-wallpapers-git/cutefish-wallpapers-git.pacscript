name="cutefish-wallpapers-git"
gives="cutefish-wallpapers"
pkgver="0.2-1"
url="https://github.com/cutefishos/wallpapers.git"
pkgver="1.0"
license="GPL-3.0"
makedepends=("cmake" "ninja-build")
pkgdesc="CutefishOS's system wallpaper."
pkgver() {
  git ls-remote "${url}" main | cut -f1 | cut -c1-8
}

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
