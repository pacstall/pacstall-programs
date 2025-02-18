pkgname="86box-app"
gives="86box"
arch=("amd64")
pkgver="4.2.1"
url='https://86box.net'
pkgdesc="Open source x86 emulator"
maintainer=("James Ed Randson <jimedrand@disroot.org>")
source=("https://github.com/86Box/86Box/releases/download/v${pkgver}/86Box-Linux-x86_64-b6130.AppImage")
sha256sums=("e049a364bc50307f7db9703960de7b6b1e3d35a7804800e98ce34ff9ba447e53")

package() {
  install -Dm755 "86Box-Linux-x86_64-b6130.AppImage" "${pkgdir}/usr/lib/86box/86box"
  install -d "${pkgdir}/usr/share/applications"
  cat << EOF > "${pkgdir}/usr/share/applications/86box.desktop"
[Desktop Entry]
Type=Application
Name=86Box
Comment=86Box is an open source x86 emulator
Exec=/usr/lib/86box/86box %f
Icon=86box
Terminal=false
Categories=Application;Utilities
EOF
}
