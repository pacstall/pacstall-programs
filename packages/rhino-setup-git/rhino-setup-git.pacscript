pkgname="rhino-setup-git"
source=("https://github.com/rhino-linux/rhino-setup.git")
arch=("any")
pkgver="2025.3-2"
makedepends=("libgtk-4-dev" "libadwaita-1-dev" "gettext" "desktop-file-utils" "rustc" "cargo" "meson" "ninja-build")
depends=("libgtk-4-dev" "libadwaita-1-dev" "gettext" "desktop-file-utils" "uidmap" "pkexec")
gives="rhino-setup"
replaces="${gives}-bin"
pkgdesc="Rhino Linux Setup Prompt"
maintainer=("Oren Klopfer <oren@taumoda.com>")
external_connection=true
incompatible=("debian:*")

build() {
  cd "rhino-setup"
  meson build
  mkdir -p "${pkgdir}/etc/skel/.config/autostart"
}

package() {
  cd "rhino-setup"
  DESTDIR="${pkgdir}" ninja -C build install
  ln -sf "/usr/local/share/applications/org.rhinolinux.RhinoSetup.desktop" "${pkgdir}/etc/skel/.config/autostart/rhino-setup.desktop"
}

post_install() {
  mkdir -p "${homedir}/.config/autostart"
  if ! [[ -f "${homedir}/.config/autostart/rhino-setup.desktop" ]]; then
    sudo ln -sf "/usr/local/share/applications/org.rhinolinux.RhinoSetup.desktop" "${homedir}/.config/autostart/rhino-setup.desktop"
  fi
}

post_remove() {
  if [[ -L "${homedir}/.config/autostart/rhino-setup.desktop" ]]; then
    sudo rm -f "${homedir}/.config/autostart/rhino-setup.desktop"
  fi
}
