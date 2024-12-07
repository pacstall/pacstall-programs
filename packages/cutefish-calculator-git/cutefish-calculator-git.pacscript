pkgname="cutefish-calculator-git"
gives="cutefish-calculator"
source=("https://github.com/cutefishos/calculator.git")
arch=("any")
pkgver="0.4"
license="GPL-3.0"
makedepends=("extra-cmake-modules" "ninja-build" "qttools5-dev-tools" "qtbase5-dev" "qtdeclarative5-dev" "qtquickcontrols2-5-dev" "qttools5-dev")
depends=("fishui" "libcutefish")
pkgdesc="CutefishOS Calculator."

prepare() {
  cd "calculator"
  mkdir build
  cd build
}

build() {
  cd "calculator"
  cmake ..
  make -j"${NCPU}"
}

package() {
  cd "calculator"
  make install DESTDIR="${pkgdir}"
}
