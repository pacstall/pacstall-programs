pkgname="papirus-icon-theme"
arch=("all")
pkgver="20250501"
pkgdesc="Papirus icon theme"
repology=("project: papirus-icon-theme" "repo: aur")
source=("@${pkgname}~${pkgver}::https://github.com/PapirusDevelopmentTeam/${pkgname}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=("3831a487f813479ad3224fdbfb0c7023f23056899bc78c93737f341aa655558e")
maintainer=("Oren Klopfer <oren@taumoda.com>")
gives="${pkgname}"
breaks=("${pkgname}" "${pkgname}-git")
depends=("gtk-update-icon-cache")
makedepends=("make")

package() {
  cd "${pkgname}~${pkgver}"
  make DESTDIR="${pkgdir}" install
}
