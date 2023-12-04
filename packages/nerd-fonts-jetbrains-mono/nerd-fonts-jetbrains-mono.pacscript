name="nerd-fonts-jetbrains-mono"
gives="nerd-fonts-jetbrains-mono"
breaks=("${gives}")
#repology=("project: fonts:nerd-fonts")
pkgver="2.2.2"
url="https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/JetBrainsMono.zip"
pkgdesc="Patched font JetBrains Mono fron nerd-fonts library"
hash="8b9b6c58081d179ecd50839a6b211dbd24b61e66d87715860129b6138982ee7b"
maintainer="Damian Bednarczyk <dbednar230@gmail.com>"

package() {
  sudo install -d "${pkgdir}"/usr/share/fonts/TTF
  sudo rm "${SRCDIR:?}/"*"Windows Compatible.ttf"
  sudo install -Dm644 "${SRCDIR}/"*.ttf "${pkgdir}"/usr/share/fonts/TTF
}
