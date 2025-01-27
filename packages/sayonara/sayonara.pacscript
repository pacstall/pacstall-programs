pkgname="sayonara"
gives="sayonara"
repology=("project: ${gives}")
arch=('amd64')
pkgver="1.10.0"
pkgrel="1"
url='https://sayonara-player.com'
source=("@${pkgname}~${pkgver}::https://gitlab.com/luciocarreras/sayonara-player/-/archive/${pkgver}-stable${pkgrel}/sayonara-player-${pkgver}-stable${pkgrel}.tar.gz")
sha256sums=("7efa5facf7eacaa4ecd3414cdd62ef576804df5ed5516fa7aa4488cb27c2f6ac")
makedepends=("cmake" "gstreamer1.0-plugins-bad" "gstreamer1.0-plugins-ugly" "lame" "libgstreamer1.0-dev"
  "libgstreamer-plugins-bad1.0-dev" "libgstreamer-plugins-base1.0-dev" "libqt5sql5-sqlite" "libqt5svg5-dev" "libmp3lame0"
  "libtag1-dev" "pkg-config" "qtbase5-dev" "qttools5-dev" "qttools5-dev-tools" "vorbis-tools" "zlib1g-dev")
conflicts=("${gives}-git")
pkgdesc="Small, clear and fast audio player for Linux written in C++"
maintainer=("villamorrd <villamorrd@students.nu-moa.edu.ph>")
license=('GPL-3.0-only')

prepare() {
  mkdir -p "${pkgname}~${pkgver}/build"
}

build() {
  cd "${pkgname}~${pkgver}/build"
  cmake ..
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}
