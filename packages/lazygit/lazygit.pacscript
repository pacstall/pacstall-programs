pkgname="lazygit"
gives="lazygit"
pkgver="0.40.2"
source=("https://github.com/jesseduffield/lazygit/releases/download/v${pkgver}/lazygit_${pkgver}_Linux_x86_64.tar.gz")
url="https://github.com/jesseduffield/lazygit"
pkgdesc="simple terminal UI for git commands"
maintainer=("Thomas Crha <thomas@9bitbyte.com>")
depends=("git")
sha256sums=("ff05cb8ebd0785ce220975e5cd394bc200424d9a58727fa81e0bbb3828db7ff1")

package() {
  cd "${_archive}"
  install -Dm755 "lazygit" "/usr/local/bin/lazygit"
}
# vim:set ft=sh ts=2 sw=2 et:
