name="rhino-linux-xfce4-config-git"
maintainer="cat-master21 <96554164+cat-master21@users.noreply.github.com>"
description="Rhino Linux XFCE4 configuration"
breaks="${pkgname}-bin"
depends="xfce4-whiskermenu-plugin yaru-theme-icon yaru-theme-gtk"
optdepends=("xfce4: to use the configuration")

url="https://github.com/rhino-linux/dotfiles.git"
pkgver() {
  git ls-remote "${url}" main | cut -f1 | cut -c1-8 # Returns the latest commit hash from remote
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
