pkgname="ttf-fira-sans"
gives="ttf-fira-sans"
arch=("all")
pkgver="4.301"
breaks=("${gives}")
repology=("project: font-fira")
replaces=("${gives}")
source=("https://fonts.google.com/download?family=Fira%20Sans")
pkgdesc="Mozilla's typeface used in Firefox OS"
sha256sums=("9ff263238eca158b0d06f2b33028651744bfcbb635bfd27714891361286dc196")
license="OFL-1.1"
maintainer=("heyzsh <haidarzsh@gmail.com>")

prepare() {
  cd "${srcdir}"
  unzip ./* -d .
}

package() {
  cd "${srcdir}"
  install -d "${pkgdir}"/usr/share/fonts/TTF
  install -Dm644 "${srcdir}"/*.ttf "${pkgdir}"/usr/share/fonts/TTF
  install -Dm644 "${srcdir}"/OFL.txt "${pkgdir}"/usr/share/licenses/"${gives}"/LICENSE
}
