  name="nerd-fonts-fira-mono"
pkgname="nerd-fonts-fira-mono"
breaks=("${pkgname}")
gives="${pkgname}"
#repology=("project: fonts:nerd-fonts")
pkgver="3.0.2"
url="https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/FiraMono.zip"
pkgdesc="Patched font JetBrains Mono fron nerd-fonts library"
hash="8af0d6cc7c51af347fe9d4c8ef1cb822689b4353ac50ecb62f69e8503757695c"
maintainer="Herisson <spaceguybox@outlook.com>"

package() {
  sudo install -d "${pkgdir}"/usr/share/fonts/TTF
  sudo rm "${SRCDIR:?}/"*"Windows Compatible.ttf"
  sudo install -Dm644 "${SRCDIR}/"*.ttf "${pkgdir}"/usr/share/fonts/TTF
}
