name="lazygit"
gives="lazygit"
pkgver="0.40.2"
url="https://github.com/jesseduffield/lazygit/releases/download/v${pkgver}/lazygit_${pkgver}_Linux_x86_64.tar.gz"
homepage="https://github.com/jesseduffield/lazygit"
pkgdesc="simple terminal UI for git commands"
maintainer="Thomas Crha <thomas@9bitbyte.com>"
depends=("git")
hash="ff05cb8ebd0785ce220975e5cd394bc200424d9a58727fa81e0bbb3828db7ff1"

package() {
  sudo install -Dm755 "lazygit" "/usr/local/bin/lazygit"
}
