name="rhino-linux-xfce4-config"
maintainer="cat-master21 <96554164+cat-master21@users.noreply.github.com>"
description="Rhino Linux XFCE4 configuration."
url="https://gitlab.gnome.org/p3732/os-installer.git"
breaks="${pkgname}-bin"
build_depends="jq"
optdepends=("xfce4: To use the configuration")
version="$(curl -s -H "Accept: application/vnd.github+json" https://api.github.com/repos/rhino-linux/dotfiles/commits | jq -r '.[1].sha')"

prepare() {
  # Is invalid as it contains sysmlinks to /home/httpllamz
  rm -rf ./xfce4/desktop
}

build() {
  sudo mkdir -p ${pkgdir}/etc/skel/.config
}

install() {
  # Install doc
  sudo install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${name}"
  # Install
  sudo cp -r xfce4 ${pkgdir}/etc/skel/.config
}

postinst() {
          cp -r /etc/skel/.config "$HOME"
}
