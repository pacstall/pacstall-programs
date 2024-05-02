pkgname="rhino-setup-bin"
depends=("gettext" "desktop-file-utils" "libadwaita-1-0")
gives="rhino-setup"
pkgdesc="Rhino Linux Setup Prompt"
maintainer=("Oren Klopfer <oren@taumoda.com>")
incompatible=("debian:*")
pkgver="2023.3"
pkgrel="2"
replaces=("${gives}" "${gives}-git")
arch=('arm64' 'amd64')
sha256sums_arm64=("b8e72f47cae41c70322cfc97f9e72096e848f51a786e2b032154a121c9e42a3d")
sha256sums_amd64=("ebc2bb8598f0eaa319b814f0fe41de994b018e11a8e1445201ca091f3cb69163")
source=("https://github.com/rhino-linux/${gives}/releases/download/v${pkgver}/${gives}_v${pkgver}_${CARCH}.zip")

build() {
  cd "${_archive}"
  mkdir -p "${pkgdir}/usr"
  mkdir -p "${pkgdir}/etc/skel/.config/autostart"
}

package() {
  cd "${_archive}"
  chmod +x "../usr/local/bin/${gives}"
  cp -rf ../usr/* "${pkgdir}/usr"
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
