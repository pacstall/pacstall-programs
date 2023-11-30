name="rhino-setup-bin"
depends=("gettext" "desktop-file-utils" "libadwaita-1-0")
gives="rhino-setup"
pkgdesc="Rhino Linux Setup Prompt"
maintainer="Oren Klopfer <oren@taumoda.com>"
incompatible=("debian:*")
pkgver="2023.3"
pkgrel="2"
replace=("${gives}" "${gives}-git")
arch=('arm64' 'amd64')
if [[ ${CARCH} == arm64 ]]; then
  hash="b8e72f47cae41c70322cfc97f9e72096e848f51a786e2b032154a121c9e42a3d"
else
  hash="ebc2bb8598f0eaa319b814f0fe41de994b018e11a8e1445201ca091f3cb69163"
fi
url="https://github.com/rhino-linux/${gives}/releases/download/v${pkgver}/${gives}_v${pkgver}_${CARCH}.zip"

build() {
  sudo mkdir -p "${pkgdir}/usr"
}

package() {
  sudo chmod +x "../usr/local/bin/${gives}"
  sudo cp -rf ../usr/* "${pkgdir}/usr"
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
    if [[ -L "${i}/.config/autostart/rhino-setup.desktop" ]]; then
      sudo rm -f "${i}/.config/autostart/rhino-setup.desktop"
    fi
  done
}
 