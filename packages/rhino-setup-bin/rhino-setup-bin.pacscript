pkgname="rhino-setup-bin"
depends=("gettext" "desktop-file-utils" "libadwaita-1-0" "uidmap" "pkexec")
gives="rhino-setup"
pkgdesc="Rhino Linux Setup Prompt"
maintainer=("Oren Klopfer <oren@taumoda.com>")
incompatible=("debian:*")
pkgver="2025.3-2"
replaces=("${gives}" "${gives}-git")
arch=('arm64' 'amd64')
sha256sums_arm64=("cd76420e33db7abef0bd38c12c13cad232d9448e0d4d1492300e17ed5d05546e")
sha256sums_amd64=("90a6f0ce196f4b6c53c215021483d2aac593f3339edb896645b9d844da21feb8")
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
