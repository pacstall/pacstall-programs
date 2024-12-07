pkgname="fishui-git"
gives="fishui"
source=("https://github.com/cutefishos/fishui.git")
arch=("any")
pkgver="0.8"
license="GPL-3.0"
makedepends=("extra-cmake-modules" "ninja-build" "qttools5-dev-tools" "qtbase5-dev" "qtdeclarative5-dev" "qtquickcontrols2-5-dev" "qttools5-dev")
depends=("libkf5windowsystem5" "libxcb-icccm4-dev" "qtquickcontrols2-5-dev" "qtbase5-private-dev" "libxcb-shape0-dev" "libxcb-keysyms1-dev")
pkgdesc="FishUI is a GUI library based on QQC2 (Qt Quick Controls 2), every Cutefish application uses it."

prepare() {
  cd "fishui"
  mkdir build
  cd build || return 1
}

build() {
  cd "fishui"
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
  make -j"${NCPU}"
}

package() {
  cd "fishui"
  make install DESTDIR="${pkgdir}"
}
