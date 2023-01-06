name="rhino-linux-xfce4-config-git"
maintainer="cat-master21 <96554164+cat-master21@users.noreply.github.com>"
description="Rhino Linux XFCE4 configuration."
breaks="${pkgname}-bin"
depends="xfce4-whiskermenu-plugin yaru-theme-icon yaru-theme-gtk"
optdepends=("xfce4: To use the configuration")

pkgver() {
  git ls-remote "${url}" main | cut -f1 | cut -c1-8 # Returns the latest commit hash from remote
}
version="$(pkgver)"
url="https://github.com/rhino-linux/dotfiles.git"

prepare() {
  true
}

build() {
  sudo mkdir -p "${pkgdir}/usr/share/backgrounds"
  sudo mkdir -p "${pkgdir}/usr/share/doc"
  sudo mkdir -p "${pkgdir}/etc/skel/.config"
  # Is a non-valid symbolic link
  rm -f xfce4/desktop/icons.screen.latest.rc
}

install() {
  # Install doc
  sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${name}"
  # Install
  sudo cp -r xfce4 "${pkgdir}/etc/skel/.config"
  sudo install -Dm644 "rolling-rhino-default.png" -t "${pkgdir}/usr/share/backgrounds"
}

postinst() {
  # To update the users configuration
  rm -rf "$HOME/.config/xfce4" || true
  mkdir -p "$HOME/.config/xfce4"
  cp -r /etc/skel/.config/xfce4/* "$HOME/.config/xfce4"
  ln -s "$HOME/.config/xfce4/desktop/icons.screen0-1904x990.rc" "$HOME/.config/xfce4/desktop/icons.screen.latest.rc"
}
