pkgname="cutefish-core-git"
gives="cutefish-core"
source=("https://github.com/cutefishos/core.git")
arch=("any")
pkgver="0.8"
license="GPL-3.0"
makedepends=("extra-cmake-modules" "ninja-build" "qttools5-dev-tools" "qtbase5-dev" "qtdeclarative5-dev" "qtquickcontrols2-5-dev" "qttools5-dev")
depends=("fishui" "libpulse-dev" "libxtst6" "libpolkit-agent-1-dev" "libxcb-randr0-dev" "libxcb1-dev" "libsm-dev" "libxcursor-dev" "libxcb-xfixes0-dev" "libxcb-damage0-dev" "libxcb-composite0-dev" "libxcb-shm0-dev" "libxcb-util-dev" "libxcb-image0-dev" "libxtst-dev" "libpulse-dev" "libpolkit-qt5-1-dev" "libkf5windowsystem-dev" "libkf5globalaccel-dev" "libqt5x11extras5-dev" "qtbase5-dev" "qtdeclarative5-dev" "qtquickcontrols2-5-dev" "qttools5-dev" "qttools5-dev-tools")
pkgdesc="System backend and start session and more."

prepare() {
  cd "core"
  mkdir build
  cd build
}

build() {
  cd "core"
  cmake ..
  make -j"${NCPU}"
}

package() {
  cd "core"
  make install DESTDIR="${pkgdir}"
}
