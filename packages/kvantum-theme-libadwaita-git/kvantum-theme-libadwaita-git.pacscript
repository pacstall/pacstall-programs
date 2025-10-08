pkgname="kvantum-theme-libadwaita-git"
gives="kvantum-theme-libadwaita"
pkgver="0.0.1"
pkgdesc="Libaidwaita theme for Kvantum"
maintainer=("Rodrigo Tavares <dev@rodrigotavar.es>")
arch=("any")
license=("GPL-3.0")
depends=("qt5-style-kvantum | qt6-style-kvantum")
source=("${pkgname}~${pkgver}::https://github.com/GabePoel/KvLibadwaita.git")

package() {
  cd "${pkgname}~${pkgver}/src"
  install -d "${pkgdir}/usr/share/Kvantum/"
  cp -r "KvLibadwaita" "${pkgdir}/usr/share/Kvantum"
}
