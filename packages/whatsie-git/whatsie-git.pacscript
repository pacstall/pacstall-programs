name="whatsie-git"
gives="whatsie"
url="https://github.com/keshavbhatt/whatsie.git"
homepage="https://github.com/keshavbhatt/whatsie"
description="Feature rich WhatsApp Client for Desktop Linux"
maintainer="Diegiwg <diegiwg@gmail.com>"
depends=("libqt5webengine5" "libqt5webenginewidgets5" "libqt5location5")
makedepends=("qtbase5-dev" "qtdeclarative5-dev" "qtlocation5-dev" "libqt5webchannel5-dev" "qtwebengine5-dev" "qtwebengine5-dev-tools")

pkgver() {
  git ls-remote "${url}" main | head -n1 | cut -f1 | cut -c1-8
}
version="$(pkgver)"

build() {
  qmake src
  make -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
}
