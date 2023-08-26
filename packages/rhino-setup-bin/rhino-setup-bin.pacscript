name="rhino-setup-bin"
depends=("gettext" "desktop-file-utils" "libadwaita-1-0")
gives="rhino-setup"
pkgdesc="Rhino Linux Setup Prompt"
maintainer="Oren Klopfer <oren@taumoda.com>"
incompatible=("debian:*")
pkgver="2023.2"
replace=("${gives}" "${gives}-git")
arch=('arm64' 'amd64')
if [[ ${CARCH} == arm64 ]]; then
  hash="65e6d7c18736d8ab496c0fce9f724730491652f4ecda3d7936747fa35837d9d3"
else
  hash="2f55d363fd470b8b24e2a6f9edbb088b2675a956c05788815815ca198f76d7ab"
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
  if ! [[ -d "${homedir}/.config/autostart" ]]; then
    mkdir -p "${homedir}/.config/autostart"
  fi
  if ! [[ -f "${homedir}/.config/autostart/rhino-setup.desktop" ]]; then
    sudo ln -sf "/usr/local/share/applications/org.rhinolinux.RhinoSetup.desktop" "${homedir}/.config/autostart/rhino-setup.desktop"
  fi
}

post_remove() {
  if [[ -f "${homedir}/.config/autostart/rhino-setup.desktop" ]]; then
    sudo rm -f "${homedir}/.config/autostart/rhino-setup.desktop"
  fi
}
