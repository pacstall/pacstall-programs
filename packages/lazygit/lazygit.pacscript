pkgname="lazygit"
gives="lazygit"
arch=("amd64")
pkgver="0.45.2"
source=("@${pkgname}~${pkgver}::https://github.com/jesseduffield/lazygit/releases/download/v${pkgver}/lazygit_${pkgver}_Linux_x86_64.tar.gz")
url="https://github.com/jesseduffield/lazygit"
pkgdesc="simple terminal UI for git commands"
maintainer=("Thomas Crha <thomas@9bitbyte.com>" "raik199x <raik199x@mail.ru>")
depends=("git")
sha256sums=("ef92a991778545fc3f912213eead3bc42965e039f99b62e069439da08bbdf478")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 "lazygit" "${pkgdir}/usr/bin/lazygit"
}
# vim:set ft=sh ts=2 sw=2 et:
