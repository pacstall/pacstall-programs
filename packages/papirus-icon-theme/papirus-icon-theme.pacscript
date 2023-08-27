name="papirus-icon-theme"
pkgver="20230104"
pkgdesc="Papirus icon theme"
repology=("project: papirus-icon-theme" "repo: aur")
url="https://github.com/PapirusDevelopmentTeam/${name}/archive/${pkgver}/${name}-${pkgver}.tar.gz"
hash="a3e91076f41bd01c754237c9f8339d1c02e286c00998f86be471ffc280542d28"
maintainer="Oren Klopfer <oren@taumoda.com>"
gives="${name}"
breaks=("${name}" "${name}-git")
depends=("gtk-update-icon-cache")
makedepends=("make")

package() {
  sudo make DESTDIR="${pkgdir}" install
}
