name="protonvpn-gui"
gives="protonvpn"
breaks="${name}-git"
replace="${name}"
repology=("project: ${name}")
version="1.8.0"
url="https://github.com/ProtonVPN/linux-app/archive/refs/tags/${version}.tar.gz"
depends="libgtk-3-dev gobject-introspection python3-psutil"
optdepends=("gnome-shell-extension-appindicator: This extension integrates Ubuntu AppIndicators and KStatusNotifierItems into GNOME Shell")
pacdeps=("protonvpn-nm-lib" "protonvpn-cli" "proton-python-client")
description="Official ProtonVPN Linux app (GUI)"
hash="8ee1003a284618d6f6c78f2048c15a7c179cbce7932a22156084040d4028b5c2"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

prepare() {
  sudo install -Dm644 "${gives}.desktop" "${STOWDIR}/usr/share/applications"
  sudo install -Dm644 "protonvpn_gui/assets/icons/${gives}-logo.png" "${STOWDIR}/usr/share/icons/hicolor/scalable/apps"
}

build() {
  python3 setup.py build
}

install() {
  sudo python3 setup.py install --root="${STOWDIR}/${name}" --optimize=1
}
