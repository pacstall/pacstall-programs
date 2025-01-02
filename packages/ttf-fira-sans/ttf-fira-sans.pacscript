pkgname="ttf-fira-sans"
gives="ttf-fira-sans"
arch=("all")
pkgver="4.202"
breaks=("${gives}")
repology=("project: font-fira")
replaces=("${gives}")
source=("https://fonts.google.com/download?family=Fira%20Sans")
pkgdesc="Mozilla's typeface used in Firefox OS"
sha256sums=("5a3059fbde784f57a58ffb55e15660ae6022c724ecbc468f58c0aaa2311c05f9")
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
