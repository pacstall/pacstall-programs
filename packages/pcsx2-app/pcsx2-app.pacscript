pkgname="pcsx2-app"
gives="pcsx2"
arch=("amd64")
pkgver="2.6.3"
repology=("project: pcsx2")
depends=("libfuse-dev")
url='https://pcsx2.net'
pkgdesc="PCSX2 is an open source PlayStation 2 Emulator"
maintainer=("James Ed Randson <jimedrand@disroot.org>")
source=("https://github.com/PCSX2/${gives}/releases/download/v${pkgver}/${gives}-v${pkgver}-linux-appimage-x64-Qt.AppImage")
sha256sums=("8ce7de8613c17b00b01028a512dd1b81998b6626ebbe93a067e0eb20aeedd5bf")

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
