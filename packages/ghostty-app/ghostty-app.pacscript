pkgname="ghostty-app"
gives="ghostty"
arch=("amd64")
pkgver="1.1.3"
url='https://github.com/psadi/ghostty-appimage'
pkgdesc="Fast, feature-rich, and cross-platform terminal emulator"
maintainer=("James Ed Randson <jimedrand@disroot.org>")
source=("https://github.com/psadi/${gives}-appimage/releases/download/v${pkgver}/Ghostty-${pkgver}-x86_64.AppImage")
sha256sums=("83872b5c2d9d8d069d933f9ec9ae7c9a5de2de9831a92fc0601ebf0797573041")

package() {
  install -Dm755 "Ghostty-${pkgver}-x86_64.AppImage" "${pkgdir}/usr/bin/ghostty"
  install -d "${pkgdir}/usr/share/applications"
  cat << EOF > "${pkgdir}/usr/share/applications/ghostty.desktop"
[Desktop Entry]
Type=Application
Name=Ghostty Terminal
Comment=Fast, feature-rich, and cross-platform terminal emulator
Exec=env APPIMAGELAUNCHER_DISABLE=1 /usr/bin/ghostty %f
Icon=ghostty
Terminal=false
Categories=Application;TerminalEmulator;Utility;
EOF
}
