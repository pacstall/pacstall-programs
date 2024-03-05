name="cutefish-dock-git"
gives="cutefish-dock"
pkgver="0.8"
source=("https://github.com/cutefishos/dock.git")
license="GPL-3.0"
makedepends=("extra-cmake-modules" "ninja-build" "qttools5-dev-tools" "qtbase5-dev" "qtdeclarative5-dev" "qtquickcontrols2-5-dev" "qttools5-dev" "libqt5x11extras5-dev" "libkf5windowsystem-dev")
depends=("fishui" "libcutefish" "libqt5svg5-dev")
pkgdesc="CutefishOS application dock."

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
