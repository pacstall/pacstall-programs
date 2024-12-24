pkgname="papirus-icon-theme"
arch=("all")
pkgver="20231201"
pkgdesc="Papirus icon theme"
repology=("project: papirus-icon-theme" "repo: aur")
source=("@${pkgname}~${pkgver}::https://github.com/PapirusDevelopmentTeam/${pkgname}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=("9dde683d6444ed2d3b3dacf8579b04d527ce278cef575d606f690c7b31c7aebd")
maintainer=("Oren Klopfer <oren@taumoda.com>")
gives="${pkgname}"
breaks=("${pkgname}" "${pkgname}-git")
depends=("gtk-update-icon-cache")
makedepends=("make")

package() {
  cd "${pkgname}~${pkgver}"
  make DESTDIR="${pkgdir}" install
}
