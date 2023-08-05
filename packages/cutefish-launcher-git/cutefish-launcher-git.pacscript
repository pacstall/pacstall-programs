name="cutefish-launcher-git"
gives="cutefish-launcher"
url="https://github.com/cutefishos/launcher.git"
pkgver="0.8"
license="GPL-3.0"
makedepends=("extra-cmake-modules" "ninja-build" "qttools5-dev-tools" "qtbase5-dev" "qtdeclarative5-dev" "qtquickcontrols2-5-dev" "qttools5-dev")
depends=("fishui" "libcutefish" "libkf5windowsystem-dev")
pkgdesc="CutefishOS's full-screen application launcher"
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
