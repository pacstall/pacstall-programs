pkgname="capsfix-git"
source=("https://github.com/oklopfer/capsfix.git")
arch=("all")
pkgver="0.0.1"
gives="capsfix"
depends=("perl" "x11-xkb-utils")
pkgdesc="Fix the nuisance of Caps Lock disable not toggling until key release"
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${gives}"
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}

post_remove() {
  sudo rm -f "${homedir}/.config/autostart/capsfix.desktop"
  sudo rm -f "${homedir}/.config/xkb_caps_backup"
}
