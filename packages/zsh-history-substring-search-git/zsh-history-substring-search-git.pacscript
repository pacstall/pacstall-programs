pkgname="zsh-history-substring-search-git"
gives="zsh-history-substring-search"
source=("https://github.com/zsh-users/zsh-history-substring-search.git")
arch=("all")
pkgver="1.1.0"
depends=("zsh")
breaks=("${gives}")
replaces=("${gives}")
pkgdesc="ZSH port of Fish history search (up arrow)"
maintainer=("Zahrun <zahrunAtmurenaDotio>")

package() {
  cd "zsh-history-substring-search"
  install -d "${pkgdir}/usr/share/zsh/plugins/zsh-history-substring-search"
  install -m 755 ./*.zsh -t "${pkgdir}/usr/share/zsh/plugins/zsh-history-substring-search"
}
