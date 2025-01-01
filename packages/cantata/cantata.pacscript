pkgname="cantata"
gives="cantata"
arch=("any")
pkgver="2.5.0"
source=("@${pkgname}~${pkgver}::https://github.com/CDrummond/cantata/releases/download/v${pkgver}/cantata-${pkgver}.tar.bz2")
depends=("mpd" "cmake" "media-player-info" "fonts-font-awesome" "libcddb2" "qttools5-dev" "qtbase5-dev" "qtchooser" "qtmultimedia5-dev" "qt5-qmake" "qtbase5-dev-tools" "libqt5svg5" "libqt5svg5-dev" "libebur128-1" "libmusicbrainz5cc2v5" "libqt5multimedia5")
pkgdesc="Cantata is a graphical client for MPD. It is support for Linux, MacOSX, and Windows, Multiple MPD collections and it has a Highly customizable layout."
maintainer=("ty1118 <tylerbj16@gmail.com>")
repology=("project: ${gives}")
sha256sums=("eb7e00ab3f567afaa02ea2c86e2fe811a475afab93182b95922c6eb126821724")

prepare() {
  cd "${pkgname}~${pkgver}"
  mkdir build
}

build() {
  cd "${pkgname}~${pkgver}"
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release ..
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  make install DESTDIR="${pkgdir}"
}

# vim:set ft=sh ts=4 sw=4 et:
