name="nerd-fonts-hack"
replaces=("${name}")
repology=("project: fonts:nerd-fonts")
pkgver="3.1.1"
source=("https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/Hack.tar.xz")
pkgdesc="Patched font Hack from Nerd Fonts library"
hash=("0d820cb2fedb86a15ca1354e03f26443face8b6aa190610263fad1125a409a16")
maintainer="Elsie19 <elsie19@pm.me>"

package() {
  sudo install -Dm644 ./*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  sudo install -Dm644 "LICENSE.md" -t "${pkgdir}/usr/share/licenses/${name}"
}
