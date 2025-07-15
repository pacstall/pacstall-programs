pkgname="lazygit"
gives="lazygit"
arch=("amd64")
pkgver="0.53.0"
source=("@${pkgname}~${pkgver}::https://github.com/jesseduffield/lazygit/releases/download/v${pkgver}/lazygit_${pkgver}_Linux_x86_64.tar.gz")
url='https://github.com/jesseduffield/lazygit'
pkgdesc="simple terminal UI for git commands"
maintainer=("Thomas Crha <thomas@9bitbyte.com>" "raik199x <raik199x@mail.ru>")
depends=("git")
sha256sums=("e379d9463b9ba68e2652dfbc4b9a1b677a7afd000c021ec10aaeb04b3491a52d")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 "lazygit" "${pkgdir}/usr/bin/lazygit"
}
# vim:set ft=sh ts=2 sw=2 et:
