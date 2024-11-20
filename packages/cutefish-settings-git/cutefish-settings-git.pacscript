pkgname="cutefish-settings-git"
gives="cutefish-settings"
arch=("any")
pkgver="0.8"
source=("https://github.com/cutefishos/settings.git")
license="GPL-3.0"
makedepends=("extra-cmake-modules" "ninja-build" "qttools5-dev-tools" "qtbase5-dev" "qtdeclarative5-dev" "qtquickcontrols2-5-dev" "qttools5-dev")
depends=("fishui" "libfontconfig1" "libfreetype-dev" "libicu-dev" "libkf5coreaddons-dev" "libcutefish" "modemmanager-qt-dev" "libkf5networkmanagerqt-dev")
pkgdesc="System Settings application for Cutefish Desktop."

prepare() {
  cd "settings"
  mkdir build
  cd build
}

build() {
  cd "settings"
  cmake ..
  make -j"${NCPU}"
}

package() {
  cd "settings"
  make install DESTDIR="${pkgdir}"
}
