pkgname="liblcf"
pkgver="0.8"
pkgdesc="Library to handle RPG Maker 2000/2003 and EasyRPG projects"
arch=('i386' 'amd64' 'arm64' 'armhf')
homepage='https://easyrpg.org'
provides=('lcf2xml')
makedepends=('pkg-config' 'libexpat1-dev' 'libicu-dev')
depends=('libexpat1')
case "${DISTRO}" in
  *:buster)   depends+=('libicu63') ;;
  *:focal)    depends+=('libicu66') ;;
  *:bullseye) depends+=('libicu67') ;;
  *:jammy)    depends+=('libicu70') ;;
  *)          depends+=('libicu72') ;;
esac
source=("https://easyrpg.org/downloads/player/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('6b0d8c7fefe3d66865336406f69ddf03fe59e52b5601687265a4d1e47a25c386')
maintainer=("vigress8 <vig@disroot.org>")
repology=("project: ${pkgname}")

build() {
  cd "${_archive}"
  ./configure --prefix=/usr \
    --enable-shared --disable-static \
    --disable-update-mimedb
  make -j"${NCPU}"
}

package() {
  cd "${_archive}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
