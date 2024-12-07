pkgname="cutefish-statusbar-git"
gives="cutefish-statusbar"
source=("https://github.com/cutefishos/statusbar.git")
arch=("any")
pkgver="0.7"
license="GPL-3.0"
makedepends=("extra-cmake-modules" "ninja-build" "qttools5-dev-tools" "qtbase5-dev" "qtdeclarative5-dev" "qtquickcontrols2-5-dev" "qttools5-dev")
depends=("fishui" "libcutefish" "libdbusmenu-qt5-dev" "libqt5svg5-dev")
pkgdesc="Top status bar of CutefishOS"

prepare() {
  cd "statusbar"
  mkdir build
  cd build
}

build() {
  cd "statusbar"
  cmake ..
  make -j"${NCPU}"
}

package() {
  cd "statusbar"
  make install DESTDIR="${pkgdir}"
}
