name="cutefish-qt-plugins-git"
gives="cutefish-qt-plugins"
pkgver="0.5"
url="https://github.com/cutefishos/qt-plugins.git"
license="GPL-3.0"
makedepends=("extra-cmake-modules" "ninja-build" "qttools5-dev-tools" "qtbase5-dev" "qtdeclarative5-dev" "qtquickcontrols2-5-dev" "libxcb-ewmh-dev" "qttools5-dev")
depends=("libkf5windowsystem-dev" "libdbusmenu-qt5-dev" "libqt5xdg-dev" "qtquickcontrols2-5-dev")
pkgdesc="Unify Qt application style of CutefishOS"
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
