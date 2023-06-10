name="whatsie-git"
gives="whatsie"
arch=("amd64")
url="https://github.com/keshavbhatt/whatsie.git"
homepage="https://github.com/keshavbhatt/whatsie"
description="Feature rich WhatsApp Client for Desktop Linux"
maintainer="Diegiwg <diegiwg@gmail.com>"
depends=("qtbase5-dev" "qtdeclarative5-dev" "qtlocation5-dev" "libqt5webchannel5-dev" "qtwebengine5-dev" "qtwebengine5-dev-tools" "qtwebengine5-private-dev" "libqt5webengine-data")
build_depends=("qtbase5-dev" "qtdeclarative5-dev" "qtlocation5-dev" "libqt5webchannel5-dev" "qtwebengine5-dev" "qtwebengine5-dev-tools" "qtwebengine5-private-dev" "libqt5webengine-data")

pkgver() {
  git ls-remote "${url}" | grep -i "tags/v" | cut -d '/' -f3 | cut -d 'v' -f2 | sort -r --version-sort | head -n 1
}
version="$(pkgver)"

build() {
  qmake src
  make -j"${NCPU}"
}

install() {
  sudo make install DESTDIR="${pkgdir}"
}
