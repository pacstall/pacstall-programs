pkgname="cutefish-filemanager-git"
gives="cutefish-filemanager"
pkgver="0.8"
source=("https://github.com/cutefishos/filemanager.git")
license="GPL-3.0"
makedepends=("extra-cmake-modules" "ninja-build" "qttools5-dev-tools" "qtbase5-dev" "qtdeclarative5-dev" "qtquickcontrols2-5-dev" "qttools5-dev")
depends=("fishui" "libcutefish" "kio" "libkf5solid-dev")
pkgdesc="Cutefish File Manager, simple to use, beautiful, and retain the classic PC interactive design."

prepare() {
  cd "${_archive}"
  mkdir build
  cd build
}

build() {
  cd "${_archive}"
  cmake ..
  make -j"${NCPU}"
}

package() {
  cd "${_archive}"
  make install DESTDIR="${pkgdir}"
}
