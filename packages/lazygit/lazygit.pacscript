pkgname="lazygit"
gives="lazygit"
arch=("amd64")
pkgver="0.54.2"
source=("@${pkgname}~${pkgver}::https://github.com/jesseduffield/lazygit/releases/download/v${pkgver}/lazygit_${pkgver}_Linux_x86_64.tar.gz")
url='https://github.com/jesseduffield/lazygit'
pkgdesc="simple terminal UI for git commands"
maintainer=("Thomas Crha <thomas@9bitbyte.com>" "raik199x <raik199x@mail.ru>")
depends=("git")
sha256sums=("cf98decf3c29f9f47e78967cb56cafc06021f616107be0200e6aefbe6fe50cd0")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 "lazygit" "${pkgdir}/usr/bin/lazygit"
}
# vim:set ft=sh ts=2 sw=2 et:
