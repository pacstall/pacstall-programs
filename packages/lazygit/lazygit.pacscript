pkgname="lazygit"
gives="lazygit"
arch=("amd64")
pkgver="0.63.0"
source=("@${pkgname}~${pkgver}::https://github.com/jesseduffield/lazygit/releases/download/v${pkgver}/lazygit_${pkgver}_Linux_x86_64.tar.gz")
url='https://github.com/jesseduffield/lazygit'
repology=("project: lazygit")
pkgdesc="simple terminal UI for git commands"
maintainer=("Thomas Crha <thomas@9bitbyte.com>" "raik199x <raik199x@mail.ru>")
depends=("git")
sha256sums=("cf5cfa3e116d7775f3600a51ec1d9ce7ba554a08b9566c7c2da83cb0023efabf")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 "lazygit" "${pkgdir}/usr/bin/lazygit"
}
# vim:set ft=sh ts=2 sw=2 et:
