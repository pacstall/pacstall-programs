pkgname="libcutefish-git"
gives="libcutefish"
arch=("any")
pkgver="0.7"
source=("https://github.com/cutefishos/libcutefish.git")
license="GPL-3.0"
makedepends=("extra-cmake-modules" "ninja-build" "qttools5-dev-tools" "qtbase5-dev" "qtdeclarative5-dev" "qtquickcontrols2-5-dev" "qttools5-dev")
depends=("kscreen" "modemmanager-qt-dev" "libkf5networkmanagerqt-dev" "libqt5quickcontrols2-5" "libkf5screen-dev" "libkf5kio-dev" "libqt5sensors5-dev" "accountsservice" "bluez")
pkgdesc="Cutefish System Library."

prepare() {
  cd "libcutefish"
  mkdir build
  cd build
}

build() {
  cd "libcutefish"
  cmake ..
  make -j"${NCPU}"
}

package() {
  cd "libcutefish"
  make install DESTDIR="${pkgdir}"
}
