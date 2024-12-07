pkgname="cutefish-kwin-plugins-git"
gives="cutefish-kwin-plugins"
arch=("any")
pkgver="0.8"
source=("https://github.com/cutefishos/kwin-plugins.git")
license="GPL-3.0"
makedepends=("extra-cmake-modules" "ninja-build" "qttools5-dev-tools" "qtbase5-dev" "qtdeclarative5-dev" "qtquickcontrols2-5-dev" "qttools5-dev")
depends=("libkf5config-dev" "libkdecorations2-dev" "libkf5guiaddons-dev" "libkf5coreaddons-dev" "libkf5configwidgets-dev" "libkf5windowsystem-dev" "libkf5wayland-dev" "kwin-dev")
pkgdesc="CutefishOS KWin Plugins."

prepare() {
  cd "kwin-plugins"
  mkdir build
}

build() {
  cd "kwin-plugins"
  cd build
  cmake ..
  make -j"${NCPU}"
}

package() {
  cd "kwin-plugins"
  cd build
  make install DESTDIR="${pkgdir}"
}
