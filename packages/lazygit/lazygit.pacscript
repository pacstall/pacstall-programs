pkgname="lazygit"
gives="lazygit"
pkgver="0.42.0"
source=("https://github.com/jesseduffield/lazygit/releases/download/v${pkgver}/lazygit_${pkgver}_Linux_x86_64.tar.gz")
url="https://github.com/jesseduffield/lazygit"
pkgdesc="simple terminal UI for git commands"
maintainer=("Thomas Crha <thomas@9bitbyte.com>")
depends=("git")
sha256sums=("c3f8f1630fa9a0a00b68425c95879e059a42158425fd720b0b303e101d347d57")

package() {
  cd "${_archive}"
  install -Dm755 "lazygit" "${pkgdir}/usr/bin/lazygit"
}
# vim:set ft=sh ts=2 sw=2 et:
