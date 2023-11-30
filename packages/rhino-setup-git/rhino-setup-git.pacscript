name="rhino-setup-git"
url="https://github.com/rhino-linux/rhino-setup.git"
pkgver="2023.3"
pkgrel="2"
makedepends=("libgtk-4-dev" "libadwaita-1-dev" "gettext" "desktop-file-utils" "rustc" "cargo" "meson" "ninja-build")
depends=("libgtk-4-dev" "libadwaita-1-dev" "gettext" "desktop-file-utils")
gives="rhino-setup"
replaces="${gives}-bin"
pkgdesc="Rhino Linux Setup Prompt"
maintainer="Oren Klopfer <oren@taumoda.com>"
incompatible=("debian:*")
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

build() {
  sudo meson build
}

package() {
  sudo DESTDIR="${pkgdir}" ninja -C build install
}

post_install() {
  for i in "${homedir}" "/etc/skel"; do
    if ! [[ -d "${i}/.config/autostart" ]]; then
      mkdir -p "${i}/.config/autostart"
    fi
    if ! [[ -f "${i}/.config/autostart/rhino-setup.desktop" ]]; then
      sudo ln -sf "/usr/local/share/applications/org.rhinolinux.RhinoSetup.desktop" "${i}/.config/autostart/rhino-setup.desktop"
    fi
  done
}

post_remove() {
  for i in "${homedir}" "/etc/skel"; do
    if [[ "${i}/.config/autostart/rhino-setup.desktop" ]]; then
      sudo rm -f "${i}/.config/autostart/rhino-setup.desktop"
    fi
  done
}
