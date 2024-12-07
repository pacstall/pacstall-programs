pkgname="cutefish-qt-plugins-git"
gives="cutefish-qt-plugins"
arch=("any")
pkgver="0.5"
source=("https://github.com/cutefishos/qt-plugins.git")
license="GPL-3.0"
makedepends=("extra-cmake-modules" "ninja-build" "qttools5-dev-tools" "qtbase5-dev" "qtdeclarative5-dev" "qtquickcontrols2-5-dev" "libxcb-ewmh-dev" "qttools5-dev")
depends=("libkf5windowsystem-dev" "libdbusmenu-qt5-dev" "libqt5xdg-dev" "qtquickcontrols2-5-dev")
pkgdesc="Unify Qt application style of CutefishOS"

prepare() {
  cd "qt-plugins"
  mkdir build
  cd build
}

build() {
  cd "qt-plugins"
  cmake ..
  make -j"${NCPU}"
}

package() {
  cd "qt-plugins"
  make install DESTDIR="${pkgdir}"
}
