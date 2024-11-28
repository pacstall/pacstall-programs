pkgname="cutefish-launcher-git"
gives="cutefish-launcher"
source=("https://github.com/cutefishos/launcher.git")
arch=("any")
pkgver="0.8"
license="GPL-3.0"
makedepends=("extra-cmake-modules" "ninja-build" "qttools5-dev-tools" "qtbase5-dev" "qtdeclarative5-dev" "qtquickcontrols2-5-dev" "qttools5-dev")
depends=("fishui" "libcutefish" "libkf5windowsystem-dev")
pkgdesc="CutefishOS's full-screen application launcher"

prepare() {
  cd "launcher"
  mkdir build
  cd build
}

build() {
  cd "launcher"
  cmake ..
  make -j"${NCPU}"
}

package() {
  cd "launcher"
  make install DESTDIR="${pkgdir}"
}
