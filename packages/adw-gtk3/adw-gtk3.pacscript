pkgname="adw-gtk3"
arch=('any')
pkgver="5.3"
pkgdesc="An unofficial GTK3 port of libadwaita."
repology=("project: adw-gtk3" "repo: aur")
source=("https://github.com/lassekongo83/adw-gtk3/releases/download/v${pkgver}/${pkgname}v${pkgver}.tar.xz")
sha256sums=("2e6e87935bef30936e40d07c7af4fd20754e77917be224f61c4346867196bef0")
maintainer=("Herisson <spaceguybox@outlook.com>")
gives="${pkgname}"
breaks=("${pkgname}" "${pkgname}-git")

build() {
  cd "${_archive}"
  mkdir -p "${pkgdir}/usr/share/themes/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/themes/${pkgname}-dark"
}

package() {
  cd "${_archive}"
  cp -r "${pkgname}"/* "${pkgdir}/usr/share/themes/${pkgname}/"
  cp -r "${pkgname}"-dark/* "${pkgdir}/usr/share/themes/${pkgname}-dark/"
}
