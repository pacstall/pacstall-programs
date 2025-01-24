pkgname="popsicle-app"
gives="popsicle"
arch=("amd64")
pkgver="1.3.3"
pkgdesc="Utility for flashing multiple USB devices in parallel and written in Rust"
maintainer=("James Ed Randson <jimedrand@disroot.org>")
source=("https://github.com/pop-os/${gives}/releases/download/${pkgver}/Popsicle_USB_Flasher-${pkgver}-x86_64.AppImage")
sha256sums=("fb975b0362032213564531c0bfb5f2b064825b9fa58c89d6b8ebd75dfcb2db50")

package() {
  install -Dm755 "Popsicle_USB_Flasher-${pkgver}-x86_64.AppImage" "${pkgdir}/usr/bin/popsicle"
  install -d "${pkgdir}/usr/share/applications"
  cat << EOF > "${pkgdir}/usr/share/applications/popsicle.desktop"
[Desktop Entry]
Type=Application
Name=Popsicle
Comment=Linux utility for flashing multiple USB devices in parallel
Exec=env APPIMAGELAUNCHER_DISABLE=1 /usr/bin/popsicle
Icon=popsicle
Terminal=false
Categories=Application;Utilities
EOF
}
