name="papirus-folders"
pkgver="1.13.1"
pkgdesc="Papirus folder theme"
repology=("project: papirus-folders")
depends=("papirus-icon-theme")
source=("https://github.com/PapirusDevelopmentTeam/${name}/archive/refs/tags/v${pkgver}.tar.gz")
hash=("df38d1a86d4aaad575d1f93f1fc541d538409d985fa418d5eac46a77c18cb028")
maintainer="Oren Klopfer <oren@taumoda.com>"

package() {
  sudo make DESTDIR="${pkgdir}" install
}
