pkgname="adw-gtk3"
arch=('any')
pkgver="5.6"
pkgdesc="An unofficial GTK3 port of libadwaita."
repology=("project: adw-gtk3" "repo: aur")
source=("@${pkgname}-${pkgver}::https://github.com/lassekongo83/adw-gtk3/releases/download/v${pkgver}/${pkgname}v${pkgver}.tar.xz")
sha256sums=("4ad286655136384f26bce80360a950473cf62532bc2650e85ce4f27776dbafa4")
maintainer=("Herisson <spaceguybox@outlook.com>" "James Ed Randson <jimedrand@disroot.org>")
gives="${pkgname}"
breaks=("${pkgname}" "${pkgname}-git")

build() {
  cd "${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/share/themes/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/themes/${pkgname}-dark"
}

package() {
  cd "${pkgname}-${pkgver}"
  cp -r "${pkgname}"/* "${pkgdir}/usr/share/themes/${pkgname}/"
  cp -r "${pkgname}"-dark/* "${pkgdir}/usr/share/themes/${pkgname}-dark/"
}
