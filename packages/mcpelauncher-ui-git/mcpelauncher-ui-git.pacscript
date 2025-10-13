pkgname="mcpelauncher-ui-git"
gives="mcpelauncher-ui"
pkgver="1.5.3"
pkgdesc="Minecraft: Pocket Edition launcher UI"
url="https://github.com/minecraft-linux/mcpelauncher-manifest"
arch=('amd64')
license=('GPL-3.0')
maintainer=("aKqir24 <aKqir24@github.com>")
conflicts=("${gives}-qt")
external_connection=true
pacdeps=('mcpelauncher-linux-git')
depends=('git')
makedepends=(
  'libxcursor-dev'
  'libxrandr-dev'
  'libxinerama-dev'
  'libxext-dev'
  'libx11-dev'
  'libxi-dev'
  'libxrender-dev'
  'libssl-dev'
  'libcurl4-openssl-dev'
  'libuv1-dev'
  'libzip-dev'
  'libprotobuf-dev'
  'protobuf-compiler'
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
)

optdepends=('mcpelauncher-msa-ui-qt: Microsoft authentication for versions before 1.16.1X')
source=("https://github.com/minecraft-linux/mcpelauncher-ui-manifest.git")

prepare() {
  cd "${gives}-manifest"
  git submodule update --init --recursive
  mkdir -p build
}

build() {
  cd "${gives}-manifest" && cd build
  cmake ..
  make -j"${NCPU}"
}

package() {
  cd "${gives}-manifest/build"
  make DESTDIR="${pkgdir}" install
}
