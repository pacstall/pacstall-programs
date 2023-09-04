name="nerd-fonts-fira-mono"
pkgname="nerd-fonts-fira-mono"
breaks=("${pkgname}")
gives="${pkgname}"
#repology=("project: fonts:nerd-fonts")
pkgver="3.0.2"
url="https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/FiraMono.zipp"
pkgdesc="Patched font JetBrains Mono fron nerd-fonts library"
hash="8b9b6c58081d179ecd50839a6b211dbd24b61e66d87715860129b6138982ee7b"
maintainer="Damian Bednarczyk <dbednar230@gmail.com>"

package() {
  sudo install -d "${pkgdir}"/usr/share/fonts/TTF
  sudo rm "${SRCDIR:?}/"*"Windows Compatible.ttf"
  sudo install -Dm644 "${SRCDIR}/"*.ttf "${pkgdir}"/usr/share/fonts/TTF
}
