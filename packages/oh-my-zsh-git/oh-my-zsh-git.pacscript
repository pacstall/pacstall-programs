pkgname="oh-my-zsh-git"
gives="${pkgname%-git}"
arch=("all")
pkgver="0.0.1"
pkgrel="3"
pkgdesc="A community-driven framework for managing your zsh configuration"
url='https://github.com/ohmyzsh/ohmyzsh'
license=('MIT')
depends=('zsh')
optdepends=('ruby: for some plugin functionality'
  'python3: for some plugin functionality')
source=("${gives}::https://github.com/${gives//-/}/${gives//-/}.git"
  "0001-zshrc.patch")
sha256sums=('SKIP' '1f314507bbb5aad57ce997b6243fb4f03b95a63a347c5da068434cff73e973c2')
maintainer=("Oren Klopfer <oren@taumoda.com>")

prepare() {
  cd "${gives}"
  cp "templates/zshrc.zsh-template" "zshrc"
  patch -p1 < "${srcdir}/0001-zshrc.patch"
}

package() {
  cd "${gives}"
  mkdir -p "${pkgdir}/usr/share/${gives}"
  install -D -m644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${gives}/LICENSE"
  cp -r ./* "${pkgdir}/usr/share/${gives}/"
}

post_install() {
  fancy_message warn "You must run the following command to use oh-my-zsh:"
  fancy_message sub "cp /usr/share/oh-my-zsh/zshrc ~/.zshrc"
}

post_remove() {
  fancy_message warn "Please remove ~/.zshrc to avoid errors."
}
