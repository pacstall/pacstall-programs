name="unicorn-desktop-git"
url="https://github.com/rhino-linux/unicorn.git"
build_depends=("xfwm4" "tint2" "rofi" "feh")
depends=("xfwm4" "tint2" "rofi" "feh")
gives="unicorn-desktop"
description="Unicorn Desktop by the Rhino Linux Team"
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}
version="$(pkgver)"

install() {
  sudo cp -r icons/* "${pkgdir}/usr/share/icons"
  sudo cp -r backgrounds/* "${pkgdir}/usr/share/backgrounds"
}

postinst() {
  sudo cp -r .xinitrc "${homedir}"
  sudo cp -r .config/* "${homedir}/.config"
}