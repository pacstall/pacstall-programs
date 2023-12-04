name="ttf-fira-sans"
pkgver="4.202"
repology=("project: font-fira")
replace=("${name}")
url="https://fonts.google.com/download?family=Fira%20Sans"
pkgdesc="Mozilla's typeface used in Firefox OS"
hash="5a3059fbde784f57a58ffb55e15660ae6022c724ecbc468f58c0aaa2311c05f9"
license="OFL-1.1"
maintainer="heyzsh <haidarzsh@gmail.com>"

prepare() {
  unzip ./* -d .
}

package() {
  sudo install -d "${pkgdir}"/usr/share/fonts/TTF
  sudo install -Dm644 "${SRCDIR}"/*.ttf "${pkgdir}"/usr/share/fonts/TTF
  sudo install -Dm644 "${SRCDIR}"/OFL.txt "${pkgdir}"/usr/share/licenses/"${name}"/LICENSE
}
