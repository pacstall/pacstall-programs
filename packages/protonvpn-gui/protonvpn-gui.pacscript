name="protonvpn-gui"
gives="protonvpn"
breaks="${name}-git"
replace="${name}"
repology=("project: ${name}")
version="1.10.0"
url="https://github.com/ProtonVPN/linux-app/archive/refs/tags/${version}.tar.gz"
depends="libgtk-3-dev gobject-introspection python3-psutil python3-setuptools"
optdepends=("gnome-shell-extension-appindicator: This extension integrates Ubuntu AppIndicators and KStatusNotifierItems into GNOME Shell")
pacdeps=("protonvpn-nm-lib" "protonvpn-cli" "proton-python-client")
description="Official ProtonVPN Linux app (GUI)"
hash="453becd020481251bc1928fe9551f48d702be9a55dd8c6030b0be48372c67363"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

prepare() {
  sudo install -Dm755 "${gives}.desktop" -t "${STOWDIR}/${name}/usr/share/applications"
  sudo install -Dm755 "protonvpn_gui/assets/icons/${gives}-logo.png" -t "${STOWDIR}/${name}/usr/share/icons/hicolor/scalable/apps"
}

build() {
  python3 setup.py build
}

install() {
  sudo python3 setup.py install --root="${STOWDIR}/${name}" --optimize=1
}
