pkgname="capsfix-git"
source=("https://github.com/oklopfer/capsfix.git")
arch=("all")
pkgver="0.0.1"
gives="capsfix"
depends_plucky=('keyd')
depends_questing=('keyd')
depends_devel=('keyd')
depends_bookworm=('keyd')
depends_trixie=('keyd')
depends_sid=('keyd')
if [[ ! "plucky questing devel bookworm trixie sid" =~ ${DISTRO#*:} ]]; then
  pacdeps=('keyd-deb')
fi
pkgdesc="Fix the nuisance of Caps Lock disable not toggling until key release"
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${gives}"
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}

post_upgrade() {
  # old configs
  sudo rm -f "${homedir}/.config/autostart/capsfix.desktop"
  sudo rm -f "${homedir}/.config/xkb_caps_backup"
}

post_remove() {
  # old configs
  sudo rm -f "${homedir}/.config/autostart/capsfix.desktop"
  sudo rm -f "${homedir}/.config/xkb_caps_backup"

  # current config
  sudo rm -f '/etc/keyd/capsfix.conf'
}
