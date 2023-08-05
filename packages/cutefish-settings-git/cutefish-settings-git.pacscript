name="cutefish-settings-git"
gives="cutefish-settings"
pkgver="0.8"
url="https://github.com/cutefishos/settings.git"
license="GPL-3.0"
makedepends=("extra-cmake-modules" "ninja-build" "qttools5-dev-tools" "qtbase5-dev" "qtdeclarative5-dev" "qtquickcontrols2-5-dev" "qttools5-dev")
depends=("fishui" "libfontconfig1" "libfreetype-dev" "libicu-dev" "libkf5coreaddons-dev" "libcutefish" "modemmanager-qt-dev" "libkf5networkmanagerqt-dev")
pkgdesc="System Settings application for Cutefish Desktop."
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
