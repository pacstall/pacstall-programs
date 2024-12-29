pkgname="nerd-fonts-hack"
replaces=("${pkgname}")
repology=("project: fonts:nerd-fonts")
arch=("all")
pkgver="3.1.1"
source=("@${pkgname}~${pkgver}::https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/Hack.tar.xz")
pkgdesc="Patched font Hack from Nerd Fonts library"
sha256sums=("0d820cb2fedb86a15ca1354e03f26443face8b6aa190610263fad1125a409a16")
maintainer=("Elsie19 <elsie19@pm.me>")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm644 ./*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 "LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
