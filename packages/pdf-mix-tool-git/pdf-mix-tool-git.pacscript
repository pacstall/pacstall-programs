name="pdf-mix-tool-git"
_name="pdf-mix-tool"
url="https://gitlab.com/scarpetta/pdfmixtool.git"
build_depends="libqpdf-dev make cmake libmagick++-6.q16-dev libqt5svg5-dev qtbase5-dev qtbase5-dev-tools qttools5-dev"
depends="libqpdf28"
breaks="${_name} ${_name}-bin ${_name}-app ${_name}-deb"
description="a GUI application to split, merge, rotate and mix PDF files"
optdepends=("ImageMagick: image manipulation tool")
maintainer="echometerain <echometer@disroot.org>"

pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}
version="$(pkgver)"

prepare() {
  mkdir build
}

build() {
  cd build || return 1
  cmake .. -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release
  make -j"$(nproc)"
}

install() {
  sudo make install DESTDIR="${STOWDIR}/${name}"
}
