pkgname="ghostty-app"
gives="ghostty"
arch=("amd64")
pkgver="1.2.0"
url='https://github.com/psadi/ghostty-appimage'
pkgdesc="Fast, feature-rich, and cross-platform terminal emulator"
maintainer=("James Ed Randson <jimedrand@disroot.org>")
repology=("project: ghostty")
source=("https://github.com/psadi/${gives}-appimage/releases/download/v${pkgver}/Ghostty-${pkgver}-x86_64.AppImage")
sha256sums=("1fa61888197f80c60b818a5f8fc5f413b7e91f925290c906f417b9281958bf16")

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
