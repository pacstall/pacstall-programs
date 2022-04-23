name="vega-strike-engine-git"
url="https://github.com/vegastrike/Vega-Strike-Engine-Source.git"
build_depends="git cmake build-essential automake autoconf libpng16-16 libpng-dev libpng-tools libjpeg-turbo8-dev libexpat1-dev libgtk-3-dev libopenal-dev libogg-dev libvorbis-dev libgl1-mesa-dev libsdl1.2-dev libpostproc-dev freeglut3-dev libboost-python-dev libboost-log-dev libboost-regex-dev"
depends="libopengl0 libopenal1"
breaks="vega-strike"
gives="vega-strike"
description="Vega Strike engine"
maintainer="echometerain <echometer@disroot.org>"

pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}
version="$(pkgver)"

prepare() {
  true
}

build() {
  mkdir build
  cd build || return 1
  cmake "../engine"
  cmake --build "./build" -DCMAKE_BUILD_TYPE=Release
  make -j"$(nproc)"
  cd ..
}

install() {
  cd build || return 1
  sudo make install DESTDIR="${STOWDIR}/${name}"
  sudo rm -rf "${STOWDIR}/${name}/usr/include"
  sudo rm -rf "${STOWDIR}/${name}/usr/lib"
}
