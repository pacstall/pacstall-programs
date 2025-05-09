pkgname="rhino-setup-bin"
depends=("gettext" "desktop-file-utils" "libadwaita-1-0" "uidmap" "pkexec")
gives="rhino-setup"
pkgdesc="Rhino Linux Setup Prompt"
maintainer=("Oren Klopfer <oren@taumoda.com>")
incompatible=("debian:*")
pkgver="2025.1"
pkgrel="4"
replaces=("${gives}" "${gives}-git")
arch=('arm64' 'amd64')
sha256sums_arm64=("721ac8160bf2df4747f80cb436add5380fd1a9ebefadfb2b321f1970b1129fa3")
sha256sums_amd64=("73168e93bfbb18428a1dad4036da95707571780332977b7177902032a39e3a3c")
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
