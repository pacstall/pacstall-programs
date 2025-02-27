pkgname="lazygit"
gives="lazygit"
arch=("amd64")
pkgver="0.47.2"
source=("@${pkgname}~${pkgver}::https://github.com/jesseduffield/lazygit/releases/download/v${pkgver}/lazygit_${pkgver}_Linux_x86_64.tar.gz")
url="https://github.com/jesseduffield/lazygit"
pkgdesc="simple terminal UI for git commands"
maintainer=("Thomas Crha <thomas@9bitbyte.com>" "raik199x <raik199x@mail.ru>")
depends=("git")
sha256sums=("52791aba3ac96ca13bce17ec154fd8a9994a4b76de3cc7982d2c5bfee05e221a")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 "lazygit" "${pkgdir}/usr/bin/lazygit"
}
# vim:set ft=sh ts=2 sw=2 et:
