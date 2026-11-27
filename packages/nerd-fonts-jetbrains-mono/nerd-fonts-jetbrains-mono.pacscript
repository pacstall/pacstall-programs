pkgname="nerd-fonts-jetbrains-mono"
replaces=("${pkgname}")
repology=("project: fonts:nerd-fonts")
arch=("all")
pkgver="3.5.1"
source=("@${pkgname}~${pkgver}::https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/JetBrainsMono.tar.xz")
pkgdesc="Patched font JetBrains Mono from Nerd Fonts library"
sha256sums=("04d5e8f903693f9dd13e16f867e994834e681eb3c72c0d337a770dcda09010cf")
maintainer=("Damian Bednarczyk <dbednar230@gmail.com>")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm644 ./*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 "OFL.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
