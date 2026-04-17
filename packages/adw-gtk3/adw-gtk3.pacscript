pkgname="adw-gtk3"
arch=('any')
pkgver="6.5"
pkgdesc="An unofficial GTK3 port of libadwaita."
repology=("project: adw-gtk3")
source=("@${pkgname}-${pkgver}::https://github.com/lassekongo83/adw-gtk3/releases/download/v${pkgver}/${pkgname}v${pkgver}.tar.xz")
sha256sums=("a81780fadfc432be0fc3d89c4ebb41aa28e4f032d42c36f9789c57dd10cfa41c")
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
