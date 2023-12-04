name="nerd-fonts-hack"
gives="nerd-fonts-hack"
breaks=("${gives}")
#repology=("project: fonts:nerd-fonts")
pkgver="2.2.2"
pkgrel="2"
url="https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/Hack.zip"
pkgdesc="Patched font Hack from nerd-fonts library"
hash="1f031b6d08d51f4830eacd00853dddc7fbd4ae0a05e169f2c13f3037dd3359b3"
maintainer="Elsie19 <elsie19@pm.me>"

package() {
  sudo install -d "${pkgdir}"/usr/share/fonts/TTF
  sudo rm ./*"Windows Compatible.ttf"
  sudo install -Dm644 ./*.ttf "${pkgdir}"/usr/share/fonts/TTF
}
