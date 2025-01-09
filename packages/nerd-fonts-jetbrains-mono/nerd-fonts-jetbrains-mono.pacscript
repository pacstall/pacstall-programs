pkgname="nerd-fonts-jetbrains-mono"
replaces=("${pkgname}")
repology=("project: fonts:nerd-fonts")
arch=("all")
pkgver="3.1.1"
source=("@${pkgname}~${pkgver}::https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/JetBrainsMono.tar.xz")
pkgdesc="Patched font JetBrains Mono from Nerd Fonts library"
sha256sums=("92225abcacf2fe500c59c5f16962528909a0c5caec8e2aa14a6546ff268a1db9")
maintainer=("Damian Bednarczyk <dbednar230@gmail.com>")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm644 ./*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
  install -Dm644 "OFL.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
