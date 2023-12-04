name="easy-zsh-config-git"
gives="easy-zsh-config"
url="https://github.com/wszqkzqk/easy-zsh-config.git"
pkgver="0.6.2"
pacdeps=("oh-my-posh-git" "zsh-history-substring-search-git")
depends=("zsh" "zsh-syntax-highlighting" "zsh-autosuggestions")
breaks=("${gives}")
replace=("${gives}")
pkgdesc="A simple but fast and out of the box configuration of zsh powered by oh-my-posh and zsh plugins"
maintainer="Zahrun <Zahrun@github.com>"
pkgver() {
  git ls-remote "${url}" refs/heads/master | cut -f1 | cut -c1-8
}

prepare() {
  sed -i s:/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh:/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh:g easy-zsh-config
  sed -i s:/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh:/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh:g easy-zsh-config
}

package() {
  sudo install -Dm644 zshrc "${pkgdir}/etc/zsh/zshrc-easy-zsh-config"
  sudo install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${name}/"
  sudo install -Dm644 easy-zsh-config "${pkgdir}/usr/share/zsh/easy-zsh-config"
}
