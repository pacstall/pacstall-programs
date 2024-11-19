pkgname="quintom-cursor-theme-git"
gives="quintom-cursor-theme"
source=("https://gitlab.com/Burning_Cube/quintom-cursor-theme.git")
arch=("all")
pkgver="0.0.1"
pkgrel="2"
pkgdesc="A cursor theme designed to look decent"
maintainer=("Elsie19 <elsie19@pm.me>")

package() {
  cd "quintom-cursor-theme"
  mkdir -p "${pkgdir}/usr/share/icons"
  cp -r 'Quintom_Ink Cursors/Quintom_Ink' "${pkgdir}/usr/share/icons"
  cp -r 'Quintom_Snow Cursors/Quintom_Snow' "${pkgdir}/usr/share/icons"
}
