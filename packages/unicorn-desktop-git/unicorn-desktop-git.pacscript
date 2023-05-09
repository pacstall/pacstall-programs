name="unicorn-desktop-git"
url="https://github.com/rhino-linux/unicorn.git"
depends=("xfwm4" "tint2" "rofi" "feh" "xfdashboard" "xfdashboard-plugins" "plank" "yaru-theme-icon" "yaru-theme-gtk")
gives="unicorn-desktop"
replace=("rhino-xfce4-mobile-config-git" "rhino-linux-xfce4-config-git")
description="Unicorn Desktop by the Rhino Linux Team"
maintainer="Oren Klopfer <oren@taumoda.com>"
pkgver() {
  git ls-remote "${url}" main | cut -f1 | cut -c1-8
}
version="$(pkgver)"
incompatible=("debian:*")

build() {
  sudo mkdir -p "${pkgdir}/usr/share/backgrounds"
  sudo mkdir -p "${pkgdir}/usr/share/doc"
  sudo mkdir -p "${pkgdir}/etc/skel/.config"
  sudo mkdir -p "${pkgdir}/usr/share/icons"
  sudo mkdir -p "${pkgdir}/usr/share/backgrounds/xfce"
}

install() {
  # Install doc
  sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${name}"
  # Install
  for i in xfce4 icons rofi plank autostart; do
    sudo cp -r "${i}" "${pkgdir}/etc/skel/.config"
  done
  sudo cp -r rhino "${pkgdir}/usr/share/backgrounds/"
  sudo cp rhino/* "${pkgdir}/usr/share/backgrounds/xfce"
  sudo install -Dm644 "logo.png" -t "${pkgdir}/usr/share/icons"
  sudo install -Dm644 "logo.svg" -t "${pkgdir}/usr/share/icons"
}

postinst() {
  if ! [[ -d "${homedir}/.config" ]]; then
    mkdir -p "${homedir}/.config"
  fi
  for i in xfce4 icons rofi plank autostart; do
    cp -r "/etc/skel/.config/${i}" "${homedir}/.config"
    sudo chown "${PACSTALL_USER}" "${homedir}/.config/${i}"
  done
}
