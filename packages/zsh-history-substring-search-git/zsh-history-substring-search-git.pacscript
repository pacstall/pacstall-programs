name="zsh-history-substring-search-git"
pkgname="zsh-history-substring-search"
source=("https://github.com/zsh-users/zsh-history-substring-search.git")
pkgver="1.1.0"
depends=("zsh")
breaks=("${pkgname}")
replaces=("${pkgname}")
gives=("${pkgname}")
pkgdesc="ZSH port of Fish history search (up arrow)"
maintainer="Zahrun <Zahrun@github.com>"

package() {
  sudo install -d "${pkgdir}/usr/share/zsh/plugins/zsh-history-substring-search"
  sudo install -m 755 ./*.zsh -t "${pkgdir}/usr/share/zsh/plugins/zsh-history-substring-search"
}
