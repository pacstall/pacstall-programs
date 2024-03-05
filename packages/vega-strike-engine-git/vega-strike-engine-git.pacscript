name="vega-strike-engine-git"
source=("https://github.com/vegastrike/Vega-Strike-Engine-Source.git")
pkgver="0.8.0"
makedepends=("git" "cmake" "build-essential" "automake" "autoconf" "libpng16-16" "libpng-dev" "libpng-tools" "libjpeg-turbo8-dev" "libexpat1-dev" "libgtk-3-dev" "libopenal-dev" "libogg-dev" "libvorbis-dev" "libgl1-mesa-dev" "libsdl1.2-dev" "libpostproc-dev" "freeglut3-dev" "libboost-python-dev" "libboost-log-dev" "libboost-regex-dev")
depends=("libopengl0" "libopenal1")
breaks=("vega-strike")
gives="vega-strike"
pkgdesc="Vega Strike engine"
maintainer="echometerain <echometer@disroot.org>"

build() {
  mkdir build
  cd build || return 1
  cmake "../engine"
  cmake --build "./build" -DCMAKE_BUILD_TYPE=Release
  make -j"${NCPU}"
  cd ..
}

package() {
  cd build || return 1
  sudo make install DESTDIR="${pkgdir}"
  sudo rm -rf "${pkgdir}/usr/include"
  sudo rm -rf "${pkgdir}/usr/lib"
}
