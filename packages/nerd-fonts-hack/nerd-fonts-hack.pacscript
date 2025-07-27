pkgname="nerd-fonts-hack"
replaces=("${pkgname}")
repology=("project: fonts:nerd-fonts")
arch=("all")
pkgver="3.4.0"
source=("@${pkgname}~${pkgver}::https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/Hack.tar.xz")
pkgdesc="Patched font Hack from Nerd Fonts library"
sha256sums=("1d00a1435638084174516975840854368a45ac30bb0bad2c0c49db713b5925f0")
maintainer=("Elsie19 <elsie19@pm.me>")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm644 ./*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 "LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
