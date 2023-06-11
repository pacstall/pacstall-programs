name="whatsie"
gives="whatsie"
homepage="https://github.com/keshavbhatt/whatsie"
description="Feature rich WhatsApp Client for Desktop Linux"
maintainer="Diegiwg <diegiwg@gmail.com>"
depends=("qtbase5-dev" "qtdeclarative5-dev" "qtlocation5-dev" "libqt5webchannel5-dev" "qtwebengine5-dev" "qtwebengine5-dev-tools" "qtwebengine5-private-dev" "libqt5webengine-data")
build_depends=("qtbase5-dev" "qtdeclarative5-dev" "qtlocation5-dev" "libqt5webchannel5-dev" "qtwebengine5-dev" "qtwebengine5-dev-tools" "qtwebengine5-private-dev" "libqt5webengine-data")
url="https://github.com/keshavbhatt/whatsie/archive/refs/tags/v${version}.tar.gz"

build() {
  qmake src
  make -j"${NCPU}"
}

install() {
  sudo make install DESTDIR="${pkgdir}"
}
