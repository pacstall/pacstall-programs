pkgname="rhino-setup-bin"
depends=("gettext" "desktop-file-utils" "libadwaita-1-0" "uidmap" "pkexec")
gives="rhino-setup"
pkgdesc="Rhino Linux Setup Prompt"
maintainer=("Oren Klopfer <oren@taumoda.com>")
incompatible=("debian:*")
pkgver="2025.3"
replaces=("${gives}" "${gives}-git")
arch=('arm64' 'amd64')
sha256sums_arm64=("26fdc09cc4a31a71f8dcf8fcbd96cacf94f5fd9e61a224b1905f15f73b8c1261")
sha256sums_amd64=("9e2708a67b8310342a235be3bf91fd8ee7847f0993edf3681dae3932d939ca54")
source=("https://github.com/rhino-linux/${gives}/releases/download/v${pkgver}/${gives}_v${pkgver}_${CARCH}.zip")

build() {
  mkdir -p "${pkgdir}/usr"
  mkdir -p "${pkgdir}/etc/skel/.config/autostart"
}

package() {
  chmod +x "usr/local/bin/${gives}"
  cp -rf usr/* "${pkgdir}/usr"
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
