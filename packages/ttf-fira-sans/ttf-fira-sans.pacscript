pkgname="ttf-fira-sans"
arch=("all")
pkgver="4.301"
breaks=("${pkgname}")
replaces=("${pkgname}")
repology=("project: font-fira")
source=("https://github.com/bBoxType/FiraSans/archive/f54eeb3124c63fe9b5bcd36d09d1cd46788cd15e.tar.gz")
pkgdesc="Mozilla's typeface used in Firefox OS"
sha256sums=("e8cdc4872b41d10b04b1ba9a3ccd7217e79f3eb33ca80416fc6ca53c47860331")
license="OFL-1.1"
maintainer=("heyzsh <haidarzsh@gmail.com>")

package() {
  cd FiraSans-*/Fira_Sans_4_3/Fonts/"Fira_Sans_TTF_${pkgver//./}"
  local fonts=(*/*/FiraSans*.ttf)
  install -dm755 "${pkgdir}/usr/share/fonts/TTF"
  for font in "${fonts[@]}"; do
    install -m644 "${font}" "${pkgdir}/usr/share/fonts/TTF"
  done
  install -Dm644 ../../../OFL.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
