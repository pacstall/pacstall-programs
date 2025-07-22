pkgname="nerd-fonts-jetbrains-mono"
replaces=("${pkgname}")
repology=("project: fonts:nerd-fonts")
arch=("all")
pkgver="3.4.0"
source=("@${pkgname}~${pkgver}::https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/JetBrainsMono.tar.xz")
pkgdesc="Patched font JetBrains Mono from Nerd Fonts library"
sha256sums=("ef552a3e638f25125c6ad4c51176a6adcdce295ab1d2ffacf0db060caf8c1582")
maintainer=("Damian Bednarczyk <dbednar230@gmail.com>")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm644 ./*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 "OFL.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
