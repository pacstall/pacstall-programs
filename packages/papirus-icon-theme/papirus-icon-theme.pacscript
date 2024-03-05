name="papirus-icon-theme"
pkgver="20231201"
pkgdesc="Papirus icon theme"
repology=("project: papirus-icon-theme" "repo: aur")
source=("https://github.com/PapirusDevelopmentTeam/${name}/archive/${pkgver}/${name}-${pkgver}.tar.gz")
hash=("9dde683d6444ed2d3b3dacf8579b04d527ce278cef575d606f690c7b31c7aebd")
maintainer="Oren Klopfer <oren@taumoda.com>"
gives="${name}"
breaks=("${name}" "${name}-git")
depends=("gtk-update-icon-cache")
makedepends=("make")

package() {
  sudo make DESTDIR="${pkgdir}" install
}
