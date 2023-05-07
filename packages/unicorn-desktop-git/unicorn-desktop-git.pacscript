name="unicorn-desktop-git"
url="https://github.com/rhino-linux/unicorn.git"
build_depends=("xfwm4" "tint2" "rofi" "feh")
depends=("xfwm4" "tint2" "rofi" "feh")
gives="unicorn-desktop"
description="Unicorn Desktop by the Rhino Linux Team"
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgver() {
  sudo mkdir tempcount && sudo chown "${PACSTALL_USER}" tempcount && cd tempcount && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b main . && echo "$(git log --format=%ct.%h)" && sudo rm -r ../tempcount && cd ..
}
version="$(pkgver)"

build() {
  sudo mkdir -p "${pkgdir}/usr/share/icons"
  sudo mkdir -p "${pkgdir}/usr/share/backgrounds"
  sudo mkdir -p "${pkgdir}/etc/skel/unicorn/.config"
}

install() {
  sudo cp -r .xinitrc "${pkgdir}/etc/skel/unicorn"
  sudo cp -r .config/* "${pkgdir}/etc/skel/unicorn/.config"
  sudo cp -r icons/* "${pkgdir}/usr/share/icons"
  sudo cp -r backgrounds/* "${pkgdir}/usr/share/backgrounds"
}

postinst() {
  mkdir -p "${homedir}/.config"
  cp -r /etc/skel/unicorn/.xinitrc "${homedir}"
  cp -r /etc/skel/unicorn/.config/* "${homedir}/.config"
}
