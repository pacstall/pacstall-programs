pkgname="liblcf"
pkgver="0.8.1"
pkgdesc="Library to handle RPG Maker 2000/2003 and EasyRPG projects"
arch=('i386' 'amd64' 'arm64' 'armhf')
url='https://easyrpg.org'
provides=('lcf2xml')
depends=('libexpat1')
makedepends=('pkg-config' 'libexpat1-dev' 'libicu-dev' "libicu78 | libicu77 | libicu76 | libicu75 | libicu74 | libicu70 | libicu67")
source=("@${pkgname}~${pkgver}::https://easyrpg.org/downloads/player/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('e827b265702cf7d9f4af24b8c10df2c608ac70754ef7468e34836201ff172273')
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
