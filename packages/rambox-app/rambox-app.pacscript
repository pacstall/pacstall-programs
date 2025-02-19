pkgname="rambox-app"
gives="rambox"
arch=("amd64")
pkgver="2.4.1"
pkgdesc="Workspace simplizer"
maintainer=("James Ed Randson <jimedrand@disroot.org>")
source=("https://github.com/ramboxapp/download/releases/download/v${pkgver}/Rambox-${pkgver}-linux-x64.AppImage")
sha256sums=("9dd16fe6b3535b2aab1860bcb7524d47e6d00b426c8ade08f69e2783b87f81c5")

package() {
  install -Dm755 "Rambox-${pkgver}-linux-x64.AppImage" "${pkgdir}/usr/bin/rambox"
  install -d "${pkgdir}/usr/share/applications"
  cat << EOF > "${pkgdir}/usr/share/applications/rambox.desktop"
[Desktop Entry]
Type=Application
Name=Rambox
Comment=Workspace simplizer
Exec=/usr/bin/rambox %f
Icon=rambox
Terminal=false
Categories=Application;Internet
EOF
}
