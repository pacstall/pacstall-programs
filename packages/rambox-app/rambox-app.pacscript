pkgname="rambox-app"
gives="rambox"
arch=("amd64")
pkgver="2.6.3"
pkgdesc="Workspace simplizer"
maintainer=("James Ed Randson <jimedrand@disroot.org>")
source=("https://github.com/ramboxapp/download/releases/download/v${pkgver}/Rambox-${pkgver}-linux-x64.AppImage")
sha256sums=("6152d3fbaa363f2efde8b06037b6603228a06e30451b24cd686fdb4b02580179")

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
