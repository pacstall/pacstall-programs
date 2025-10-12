pkgname="mcpelauncher-linux-git"
gives="mcpelauncher"
pkgver="1.5.3"
pkgdesc="Minecraft: Pocket Edition launcher for Linux"
url='https://github.com/minecraft-linux/mcpelauncher-manifest'
arch=('amd64')
license=('GPL-3.0-only')
maintainer=("aKqir24 <aKqir24@github.com>")
external_connection=true

depends=('git')
makedepends=(
  'clang'
  'cmake'
  'make'
  'ca-certificates'
  'libssl-dev'
  'libpng-dev'
  'libx11-dev'
  'libxi-dev'
  'libcurl4-openssl-dev'
  'libudev-dev'
  'libevdev-dev'
  'libegl1-mesa-dev'
  'libasound2'
  'qtbase5-dev'
  'qtwebengine5-dev'
  'qtdeclarative5-dev'
  'libqt5svg5-dev'
  'qml-module-qtquick2'
  'qml-module-qtquick-layouts'
  'qml-module-qtquick-controls'
  'qml-module-qtquick-controls2'
  'qml-module-qtquick-window2'
  'qml-module-qtquick-dialogs'
  'qml-module-qt-labs-settings'
  'qml-module-qt-labs-folderlistmodel'
  'qml-module-qtwebengine')
optdepends=('mcpelauncher-msa-ui-qt: Microsoft authentication for versions before 1.16.1X')
source=("https://github.com/minecraft-linux/mcpelauncher-manifest.git")

prepare() {
  cd "${gives}-manifest"
  git submodule update --init --recursive
  mkdir -p build
}

build() {
  cd "${gives}-manifest" && cd build
  CC=clang CXX=clang++ cmake .. -Wno-dev -DCMAKE_BUILD_TYPE=Release -DJNI_USE_JNIVM=ON
  make -j"${NCPU}"
}

package() {
  cd "${gives}-manifest/build"
  make DESTDIR="${pkgdir}" install
}
