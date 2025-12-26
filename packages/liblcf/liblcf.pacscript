pkgname="liblcf"
pkgver="0.8"
pkgdesc="Library to handle RPG Maker 2000/2003 and EasyRPG projects"
arch=('i386' 'amd64' 'arm64' 'armhf')
url='https://easyrpg.org'
provides=('lcf2xml')
makedepends=('pkg-config' 'libexpat1-dev' 'libicu-dev')
depends=('libexpat1')
depends_buster=('libicu63')
depends_focal=('libicu66')
depends_bullseye=('libicu67')
depends_jammy=('libicu70')
if [[ ! "buster focal bullseye jammy" =~ ${DISTRO#*:} ]]; then
  depends+=('libicu72')
fi
source=("@${pkgname}~${pkgver}::https://easyrpg.org/downloads/player/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('6b0d8c7fefe3d66865336406f69ddf03fe59e52b5601687265a4d1e47a25c386')
repology=("project: ${pkgname}")

build() {
  cd "${pkgname}~${pkgver}"
  ./configure --prefix=/usr \
    --enable-shared --disable-static \
    --disable-update-mimedb
  make -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
