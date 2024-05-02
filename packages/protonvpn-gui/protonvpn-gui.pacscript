pkgname="protonvpn-gui"
gives="protonvpn"
breaks=("${pkgname}-git")
replaces=("${pkgname}")
repology=("project: ${pkgname}")
pkgver="1.12.0"
source=("https://github.com/ProtonVPN/linux-app/archive/refs/tags/${pkgver}.tar.gz")
makedepends=("libgtk-3-dev" "gobject-introspection" "python3-psutil" "python3-setuptools")
optdepends=("gnome-shell-extension-appindicator: This extension integrates Ubuntu AppIndicators and KStatusNotifierItems into GNOME Shell")
pacdeps=("protonvpn-nm-lib" "protonvpn-cli" "proton-python-client")
pkgdesc="Official ProtonVPN Linux app (GUI)"
sha256sums=("708dd5aa04a12963361a7a13188c65938b94adc268608e341faa2985312e7f94")
maintainer=("Oren Klopfer <oren@taumoda.com>")

prepare() {
  cd "${_archive}"
  install -Dm755 "${gives}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm755 "protonvpn_gui/assets/icons/${gives}-logo.png" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
}

build() {
  cd "${_archive}"
  python3 setup.py build
}

package() {
  cd "${_archive}"
  python3 setup.py install --root="${pkgdir}" --optimize=1
}
