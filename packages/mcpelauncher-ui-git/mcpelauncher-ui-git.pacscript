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
depends=(
  'git'
  'qtwebengine5-dev'
  'libqt5quickcontrols2-5'
  'libqt5quicktemplates2-5'
  'qml-module-qtquick-controls2'
  'qml-module-qtquick-templates2'
)
makedepends=(
  libxcursor-dev
  libxrandr-dev
  libxinerama-dev
  libxext-dev
  libx11-dev
  libxi-dev
  libxrender-dev
  libssl-dev
  libcurl4-openssl-dev
  libuv1-dev
  libzip-dev
  libprotobuf-dev
  protobuf-compiler
  qt6-base-dev
  qt6-webengine-dev
  qt6-declarative-dev
  libqt6svg6-dev
  qml6-module-qtquick
  qml6-module-qtquick-layouts
  qml6-module-qtquick-controls
  qml6-module-qtquick-controls2
  qml6-module-qtquick-window
  qml6-module-qtquick-dialogs
  qml6-module-qt-labs-settings
  qml6-module-qt-labs-folderlistmodel
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
