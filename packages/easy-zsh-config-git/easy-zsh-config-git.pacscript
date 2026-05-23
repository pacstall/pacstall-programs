pkgname="easy-zsh-config-git"
gives="easy-zsh-config"
source=("https://github.com/wszqkzqk/easy-zsh-config.git")
arch=("all")
pkgver="0.6.2"
pacdeps=("oh-my-posh-git" "zsh-history-substring-search-git")
depends=("zsh" "zsh-syntax-highlighting" "zsh-autosuggestions")
breaks=("${gives}")
replaces=("${gives}")
pkgdesc="A simple but fast and out of the box configuration of zsh powered by oh-my-posh and zsh plugins"
maintainer=("Zahrun <zahrunAtmurenaDotio>")

prepare() {
  cd "easy-zsh-config"
  sed -i s:/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh:/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh:g easy-zsh-config
  sed -i s:/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh:/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh:g easy-zsh-config
}

package() {
  cd "easy-zsh-config"
  install -Dm644 zshrc "${pkgdir}/etc/zsh/zshrc-easy-zsh-config"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 easy-zsh-config "${pkgdir}/usr/share/zsh/easy-zsh-config"
}
