pkgname="pdf-mix-tool-git"
gives="pdf-mix-tool"
source=("https://gitlab.com/scarpetta/pdfmixtool.git")
arch=("any")
pkgver="1.1.1"
makedepends=("libqpdf-dev" "make" "cmake" "libmagick++-6.q16-dev" "libqt5svg5-dev" "qtbase5-dev" "qtbase5-dev-tools" "qttools5-dev")
depends=("libqpdf28")
breaks=("${gives}" "${gives}-bin" "${gives}-app" "${gives}-deb")
pkgdesc="a GUI application to split, merge, rotate and mix PDF files"
optdepends=("ImageMagick: image manipulation tool")
maintainer=("echometerain <echometer@disroot.org>")

prepare() {
  cd "pdfmixtool"
  mkdir build
}

build() {
  cd "pdfmixtool"
  cd build || return 1
  cmake .. -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release
  make -j"${NCPU}"
}

package() {
  cd "pdfmixtool"
  make install DESTDIR="${pkgdir}"
}
