name="protonvpn-gui"
gives="protonvpn"
breaks="${name}-git"
replace="${name}"
repology=("project: ${name}")
version="1.12.0"
url="https://github.com/ProtonVPN/linux-app/archive/refs/tags/${version}.tar.gz"
build_depends="libgtk-3-dev gobject-introspection python3-psutil python3-setuptools"
optdepends=("gnome-shell-extension-appindicator: This extension integrates Ubuntu AppIndicators and KStatusNotifierItems into GNOME Shell")
pacdeps=("protonvpn-nm-lib" "protonvpn-cli" "proton-python-client")
description="Official ProtonVPN Linux app (GUI)"
hash="708dd5aa04a12963361a7a13188c65938b94adc268608e341faa2985312e7f94"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

prepare() {
  sudo install -Dm755 "${gives}.desktop" -t "${pkgdir}/usr/share/applications"
  sudo install -Dm755 "protonvpn_gui/assets/icons/${gives}-logo.png" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
}

build() {
  python3 setup.py build
}

install() {
  sudo python3 setup.py install --root="${pkgdir}" --optimize=1
}
