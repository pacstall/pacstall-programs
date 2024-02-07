name="cantata"
pkgname="cantata"
pkgver="2.5.0"
url="https://github.com/CDrummond/cantata/releases/download/v${pkgver}/cantata-${pkgver}.tar.bz2"
depends=("mpd" "cmake" "media-player-info" "fonts-font-awesome" "libcddb2" "qttools5-dev" "qtbase5-dev" "qtchooser" "qtmultimedia5-dev" "qt5-qmake" "qtbase5-dev-tools" "libqt5svg5" "libqt5svg5-dev" "libebur128-1" "libmusicbrainz5cc2v5" "libqt5multimedia5")
pkgdesc="Cantata is a graphical client for MPD. It is support for Linux, MacOSX, and Windows, Multiple MPD collections and it has a Highly customizable layout."
maintainer="ty1118 <tylerbj16@gmail.com>"
repology=("project: ${pkgname}")
hash="eb7e00ab3f567afaa02ea2c86e2fe811a475afab93182b95922c6eb126821724"

prepare() {
  mkdir build
}

build() {
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release ..
  make -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
}
