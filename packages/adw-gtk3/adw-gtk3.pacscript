pkgname="adw-gtk3"
arch=('any')
pkgver="6.4"
pkgdesc="An unofficial GTK3 port of libadwaita."
repology=("project: adw-gtk3")
source=("@${pkgname}-${pkgver}::https://github.com/lassekongo83/adw-gtk3/releases/download/v${pkgver}/${pkgname}v${pkgver}.tar.xz")
sha256sums=("c396e4f0df3eea081186ae13321345f21b9934691b4b4d75b4956f00cbd033d1")
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
