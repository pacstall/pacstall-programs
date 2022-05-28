name="protonvpn-gui"
gives="protonvpn"
breaks="${name}-git"
replace="${name}"
repology=("project: ${name}")
version="1.9.0"
url="https://github.com/ProtonVPN/linux-app/archive/refs/tags/${version}.tar.gz"
depends="libgtk-3-dev gobject-introspection python3-psutil"
optdepends=("gnome-shell-extension-appindicator: This extension integrates Ubuntu AppIndicators and KStatusNotifierItems into GNOME Shell")
pacdeps=("protonvpn-nm-lib" "protonvpn-cli" "proton-python-client")
description="Official ProtonVPN Linux app (GUI)"
hash="0fb03fa0d3999ad11ea70078e9378cfe3012fdec28555c3f97a6622507e09f16"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

prepare() {
  sudo mkdir -p "${STOWDIR}/${name}/usr/share/applications"
  sudo mkdir -p "${STOWDIR}/${name}/usr/share/icons/hicolor/scalable/apps"
  sudo mv "${gives}.desktop" "${STOWDIR}/${name}/usr/share/applications"
  sudo mv "protonvpn_gui/assets/icons/${gives}-logo.png" "${STOWDIR}/${name}/usr/share/icons/hicolor/scalable/apps"
}

build() {
  python3 setup.py build
}

install() {
  sudo python3 setup.py install --root="${STOWDIR}/${name}" --optimize=1
}
