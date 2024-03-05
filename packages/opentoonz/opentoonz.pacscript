name="opentoonz"
pkgver="1.7.1"
source=("https://github.com/opentoonz/opentoonz/archive/refs/tags/v${pkgver}.tar.gz")
makedepends=("libboost-all-dev" "qtbase5-dev" "libqt5svg5-dev" "qtscript5-dev" "qttools5-dev" "libqt5opengl5-dev" "qtmultimedia5-dev" "libqt5serialport5-dev" "libsuperlu-dev" "liblz4-dev" "libusb-1.0-0-dev" "liblzo2-dev" "libpng-dev" "libjpeg-dev" "libglew-dev" "freeglut3-dev" "libfreetype6-dev" "libjson-c-dev" "qtwayland5" "libmypaint-dev" "libopencv-dev" "libturbojpeg-dev" "libmypaint-dev" "libopenblas-dev" "libegl1-mesa-dev" "libgles2-mesa-dev" "libglib2.0-dev" "liblzma-dev" "cmake" "build-essential" "git")
depends=("qtchooser" "qt5-qmake" "qtbase5-dev-tools" "qttools5-dev-tools" "libqt5multimedia5-plugins" "qtwayland5" "libgsl-dev" "pkg-config")
pkgdesc="An open-source full-featured 2D animation creation software"
hash=("d0daf60d06510efe15d0db3f9eed0162499ed58061504dca27892c2b9ea5f22d")
maintainer="echometerain <echometer@disroot.org>"
gives="opentoonz"
breaks=("${name}-git" "${name}-deb" "${name}-app" "${name}-deb" "${name}-bin")
repology=("project: opentoonz")

prepare() {

  sudo mkdir -p "/home/${LOGNAME}/.config/OpenToonz"
  sudo cp -r "./stuff" "/home/${LOGNAME}/.config/OpenToonz/"
  sudo chown -R "${LOGNAME}" "/home/${LOGNAME}/.config/OpenToonz/"

  cd "toonz" || return
  mkdir build
  cd "../" || return
}

build() {

  cd "thirdparty/tiff-4.0.3" || return
  ./configure --with-pic --disable-jbig
  make -j"${NCPU}"
  cd "../../" || return

  cd "toonz/build" || return
  cmake "../sources"
  make -j"${NCPU}"
  cd "../../" || return

}

package() {

  cd "toonz/build" || return
  sudo mkdir -p "${pkgdir}/usr/share/pixmaps/"
  sudo mkdir -p "${pkgdir}/usr/share/applications/"
  sudo make install DESTDIR="${pkgdir}"
  cd "../../" || return
  sudo install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${name}/LICENSE.txt"
  sudo chmod +x "${pkgdir}/opt/${name}/bin/opentoonz"

  sudo install -Dm755 "toonz/sources/xdg-data/io.github.OpenToonz.desktop" "${pkgdir}/usr/share/applications/"
  sudo install -Dm644 "toonz/sources/xdg-data/io.github.OpenToonz.png" "${pkgdir}/usr/share/pixmaps/"

  printf '#!/bin/sh\nsh /opt/opentoonz/bin/opentoonz' | sudo tee /usr/bin/opentoonz > /dev/null
  sudo chmod +x "/usr/bin/opentoonz"
}

post_remove() {
  ask "Do you want to remove your opentoonz config?" N
  if [[ ${answer} -eq 1 ]]; then
    rm -rf "/home/${LOGNAME}/.config/OpenToonz/"
  fi
}
