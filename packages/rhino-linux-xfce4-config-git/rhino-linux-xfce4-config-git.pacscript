name="rhino-linux-xfce4-config-git"
maintainer="cat-master21 <96554164+cat-master21@users.noreply.github.com>"
description="Rhino Linux XFCE4 configuration"
breaks=("${pkgname}-bin")
replace=("rhino-xfce4-mobile-config-git" "unicorn-desktop" "unicorn-desktop-git")
depends=("xfce4-whiskermenu-plugin" "yaru-theme-icon" "yaru-theme-gtk")
optdepends=("xfce4: to use the configuration")

url="https://github.com/rhino-linux/dotfiles.git"
pkgver() {
  mkdir /tmp/count/ && cd /tmp/count && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b main . && git log --format=%ct.%h && rm -r /tmp/count/ # Returns the latest commit hash from remote
}
version="$(pkgver)"

build() {
  sudo mkdir -p "${pkgdir}/usr/share/backgrounds"
  sudo mkdir -p "${pkgdir}/usr/share/doc"
  sudo mkdir -p "${pkgdir}/etc/skel/.config"
  sudo mkdir -p "${pkgdir}/usr/share/icons"
  sudo mkdir -p "${pkgdir}/usr/share/backgrounds/xfce"
  # Is not a valid link
  sudo rm -f xfce4/desktop/icons.screen.latest.rc
}

install() {
  # Install doc
  sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${name}"
  # Install
  sudo cp -r xfce4 "${pkgdir}/etc/skel/.config"
  sudo cp -r rhino "${pkgdir}/usr/share/backgrounds/"
  sudo cp rhino/* "${pkgdir}/usr/share/backgrounds/xfce"
  sudo install -Dm644 "logo.png" -t "${pkgdir}/usr/share/icons"
  sudo install -Dm644 "logo.svg" -t "${pkgdir}/usr/share/icons"
}

postinst() {
  if ! [[ -d "${homedir}/.config" ]]; then
    mkdir -p "${homedir}/.config"
  fi
  cp -r "/etc/skel/.config/xfce4" "${homedir}/.config"
}
