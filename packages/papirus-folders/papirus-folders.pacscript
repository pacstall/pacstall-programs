pkgname="papirus-folders"
arch=("all")
pkgver="1.14.0"
pkgdesc="Papirus folder theme"
repology=("project: papirus-folders")
depends=("papirus-icon-theme")
source=("@${pkgname}~${pkgver}::https://github.com/PapirusDevelopmentTeam/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("658723db46638ad988ef91ed7d28e9941b528418f7c83d51fe17cdf4985e6dd2")
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${pkgname}~${pkgver}"
  make DESTDIR="${pkgdir}" install
}
