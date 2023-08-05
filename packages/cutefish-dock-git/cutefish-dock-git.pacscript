name="cutefish-dock-git"
gives="cutefish-dock"
pkgver="0.8"
url="https://github.com/cutefishos/dock.git"
license="GPL-3.0"
makedepends=("extra-cmake-modules" "ninja-build" "qttools5-dev-tools" "qtbase5-dev" "qtdeclarative5-dev" "qtquickcontrols2-5-dev" "qttools5-dev" "libqt5x11extras5-dev" "libkf5windowsystem-dev")
depends=("fishui" "libcutefish" "libqt5svg5-dev")
pkgdesc="CutefishOS application dock."
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
