name="whatsie-git"
gives="whatsie"
version="4.14.1"
arch=("amd64")
url="https://github.com/keshavbhatt/whatsie.git"
homepage="https://github.com/keshavbhatt/whatsie"
description="Feature rich WhatsApp Client for Desktop Linux"
maintainer="Diegiwg <diegiwg@gmail.com>"
depends=("qtbase5-dev" "qtdeclarative5-dev" "qtlocation5-dev" "libqt5webchannel5-dev" "qtwebengine5-dev" "qtwebengine5-dev-tools" "qtwebengine5-private-dev" "libqt5webengine-data")
build_depends=("qtbase5-dev" "qtdeclarative5-dev" "qtlocation5-dev" "libqt5webchannel5-dev" "qtwebengine5-dev" "qtwebengine5-dev-tools" "qtwebengine5-private-dev" "libqt5webengine-data")

build() {
  qmake src
  make -j"${NCPU}"
}

install() {
  sudo make install DESTDIR="${pkgdir}"
}
