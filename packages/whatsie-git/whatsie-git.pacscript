pkgname="whatsie-git"
gives="whatsie"
source=("https://github.com/keshavbhatt/whatsie.git")
arch=("any")
pkgver="4.14.1"
url='https://github.com/keshavbhatt/whatsie'
pkgdesc="Feature rich WhatsApp Client for Desktop Linux"
maintainer=("Diegiwg <diegiwg@gmail.com>")
depends=("libqt5webengine5" "libqt5webenginewidgets5" "libqt5location5")
makedepends=("qtbase5-dev" "qtdeclarative5-dev" "qtlocation5-dev" "libqt5webchannel5-dev" "qtwebengine5-dev" "qtwebengine5-dev-tools")

build() {
  cd "whatsie"
  qmake src
  make -j"${NCPU}"
}

package() {
  cd "whatsie"
  make install DESTDIR="${pkgdir}"
}
