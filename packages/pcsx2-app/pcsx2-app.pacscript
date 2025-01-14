pkgname="pcsx2-app"
gives="pcsx2"
arch=("amd64")
pkgver="2.2.0"
url="https://pcsx2.net"
pkgdesc="PCSX2 is an open source PlayStation 2 Emulator"
maintainer=("James Ed Randson <jimedrand@disroot.org>")
source=("https://github.com/PCSX2/${gives}/releases/download/v${pkgver}/${gives}-v${pkgver}-linux-appimage-x64-Qt.AppImage")
sha256sums=("188cd6a7db7dab8dd509b744f5f02f7dc5746f9d637303b08063f46a779967ab")

package() {
  install -Dm755 "${gives}-v${pkgver}-linux-appimage-x64-Qt.AppImage" "${pkgdir}/usr/bin/pcsx2"
  install -d "${pkgdir}/usr/share/applications"
  cat << EOF > "${pkgdir}/usr/share/applications/pcsx2.desktop"
[Desktop Entry]
Type=Application
Name=PCSX2
Comment=PCSX2 is an open source PlayStation 2 Emulator
Exec=/usr/bin/pcsx2 %f
Icon=pcsx2
Terminal=false
Categories=Application;Game
EOF
}
