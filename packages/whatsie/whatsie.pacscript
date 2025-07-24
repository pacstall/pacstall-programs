pkgname="whatsie"
gives="whatsie"
arch=("any")
pkgver="4.16.3"
source=("@${pkgname}~${pkgver}::https://github.com/keshavbhatt/whatsie/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("6149c05e30d87e61ee480d7ead082224cf9f32fea61a3820c0f7225ae8a8a616")
url='https://github.com/keshavbhatt/whatsie'
pkgdesc="Feature rich WhatsApp Client for Desktop Linux"
maintainer=("Diegiwg <diegiwg@gmail.com>")
depends=("libqt5webengine5" "libqt5webenginewidgets5" "libqt5location5")
makedepends=("qtbase5-dev" "qtdeclarative5-dev" "qtlocation5-dev" "libqt5webchannel5-dev" "qtwebengine5-dev" "qtwebengine5-dev-tools")

build() {
  cd "${pkgname}~${pkgver}"
  qmake src
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  make install DESTDIR="${pkgdir}"
}
