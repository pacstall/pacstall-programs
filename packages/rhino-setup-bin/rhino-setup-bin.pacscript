name="rhino-setup-bin"
depends=("gettext" "desktop-file-utils" "libadwaita-1-0")
gives="rhino-setup"
pkgdesc="Rhino Linux Setup Prompt"
maintainer="Oren Klopfer <oren@taumoda.com>"
incompatible=("debian:*")
pkgver="2023.1"
replace=("${gives}" "${gives}-git")

if [[ ${CARCH} == arm64 ]]; then
  url="https://github.com/rhino-linux/${gives}/releases/download/v${pkgver}/${gives}_v${pkgver}_${CARCH}.zip"
  hash="b0f78e12d0ab74173936cf826d85e4fe66110a79ec6bd702fba27ca8bf9d6ae6"
  arch=('arm64')
else
  url="https://github.com/rhino-linux/${gives}/releases/download/v${pkgver}/${gives}_v${pkgver}_${CARCH}.zip"
  hash="10f3dc3311b9f71f56616cee8c85e8df6c7ba1eee6a4dc1ba2afb73fad27fe29"
  arch=('amd64')
fi

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
