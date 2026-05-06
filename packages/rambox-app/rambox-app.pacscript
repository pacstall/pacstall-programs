pkgname="rambox-app"
gives="rambox"
arch=("amd64")
pkgver="2.5.2"
pkgdesc="Workspace simplizer"
maintainer=("James Ed Randson <jimedrand@disroot.org>")
source=("https://github.com/ramboxapp/download/releases/download/v${pkgver}/Rambox-${pkgver}-linux-x64.AppImage")
sha256sums=("b31fd72ebb0322dd9c178c6ffc9e62d594cc7fb787b1c7018cf10c27f5884a68")

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
