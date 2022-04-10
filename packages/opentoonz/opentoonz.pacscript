name="opentoonz"
version="1.6.0"
url="https://github.com/opentoonz/opentoonz/archive/refs/tags/v${version}.tar.gz"
build_depends="libboost-all-dev qtbase5-dev libqt5svg5-dev qtscript5-dev qttools5-dev libqt5opengl5-dev qtmultimedia5-dev libqt5serialport5-dev libsuperlu-dev liblz4-dev libusb-1.0-0-dev liblzo2-dev libpng-dev libjpeg-dev libglew-dev freeglut3-dev libfreetype6-dev libjson-c-dev qtwayland5 libmypaint-dev libopencv-dev libturbojpeg-dev libmypaint-dev libopenblas-dev libegl1-mesa-dev libgles2-mesa-dev libglib2.0-dev liblzma-dev cmake build-essential git"
depends="qtchooser qt5-qmake qtbase5-dev-tools qttools5-dev-tools libqt5multimedia5-plugins qtwayland5 libgsl25 pkg-config"
description="An open-source full-featured 2D animation creation software"
hash="9a6c28cb3933756dbebb45e849bdafc9e6d93d0328c4fd4d7bc8ec3ae481f684"
maintainer="echometerain <echometer@disroot.org>"
gives="opentoonz"
breaks="${name}-git ${name}-deb ${name}-app ${name}-deb ${name}-bin"
repology=("project: opentoonz")

prepare() {

  sudo mkdir -p "/home/${LOGNAME}/.config/OpenToonz"
  sudo cp -r "opentoonz/stuff" "/home/${LOGNAME}/.config/OpenToonz/"
  sudo chown -R "${LOGNAME}" "/home/${LOGNAME}/.config/OpenToonz/"

  cd "toonz" || return
  mkdir build
  cd "../" || return
}

build() {

  cd "thirdparty/tiff-4.0.3" || return
  ./configure --with-pic --disable-jbig
  make -j"$(nproc)"
  cd "../../" || return

  cd "toonz/build" || return
  cmake "../sources"
  make -j"$(nproc)"
  cd "../../" || return

}

install() {

  cd "toonz/build" || return
  sudo mkdir -p "/usr/src/pacstall/opentoonz/usr/share/pixmaps/"
  sudo mkdir -p "/usr/src/pacstall/opentoonz/usr/share/applications/"
  sudo make install DESTDIR="${STOWDIR}/${name}"
  cd "../../" || return
  sudo install -Dm644 LICENSE.txt "${STOWDIR}/${name}/usr/share/licenses/${name}/LICENSE.txt"
  sudo chmod +x "${STOWDIR}/${name}/opt/${name}/bin/opentoonz"

  sudo install -Dm755 "toonz/sources/xdg-data/io.github.OpenToonz.desktop" "${STOWDIR}/${name}/usr/share/applications/"
  sudo install -Dm644 "toonz/sources/xdg-data/io.github.OpenToonz.png" "${STOWDIR}/${name}/usr/share/pixmaps/"
}

removescript() {

  ask "Do you want to remove your opentoonz config?" N
  if [[ ${answer} -eq 1 ]]; then
    sudo rm -rf "home/${LOGNAME}/.config/OpenToonz/"
  fi
}
