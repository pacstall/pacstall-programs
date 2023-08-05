name="libcutefish-git"
gives="libcutefish"
pkgver="0.7"
url="https://github.com/cutefishos/libcutefish.git"
license="GPL-3.0"
makedepends=("extra-cmake-modules" "ninja-build" "qttools5-dev-tools" "qtbase5-dev" "qtdeclarative5-dev" "qtquickcontrols2-5-dev" "qttools5-dev")
depends=("kscreen" "modemmanager-qt-dev" "libkf5networkmanagerqt-dev" "libqt5quickcontrols2-5" "libkf5screen-dev" "libkf5kio-dev" "libqt5sensors5-dev" "accountsservice" "bluez")
pkgdesc="Cutefish System Library."
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
