name="whatsie-git"
gives="whatsie"
url="https://github.com/keshavbhatt/whatsie.git"
pkgver="4.14.1"
homepage="https://github.com/keshavbhatt/whatsie"
pkgdesc="Feature rich WhatsApp Client for Desktop Linux"
maintainer="Diegiwg <diegiwg@gmail.com>"
depends=("libqt5webengine5" "libqt5webenginewidgets5" "libqt5location5")
makedepends=("qtbase5-dev" "qtdeclarative5-dev" "qtlocation5-dev" "libqt5webchannel5-dev" "qtwebengine5-dev" "qtwebengine5-dev-tools")
pkgver() {
  git ls-remote "${url}" main | cut -f1 | cut -c1-8
}

build() {
  qmake src
  make -j"${NCPU}"
}

package() {
  sudo make install DESTDIR="${pkgdir}"
}
