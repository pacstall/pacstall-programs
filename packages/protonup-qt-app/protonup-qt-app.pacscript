pkgname="protonup-qt-app"
gives="net.davidotek.pupgui2"
pkgver="2.16.0"
pkgdesc="Install and manage Proton-GE and Luxtorpeda for Steam and Wine-GE for Lutris"
source=(
  "https://github.com/DavidoTek/ProtonUp-Qt/releases/download/v${pkgver}/ProtonUp-Qt-${pkgver}-x86_64.AppImage"
  "net.davidotek.pupgui2.png::https://raw.githubusercontent.com/DavidoTek/ProtonUp-Qt/main/share/icons/hicolor/256x256/apps/net.davidotek.pupgui2.png"
)
sha256sums=(
  "862a717502f0b9601f23e849a4b4dfe3d69aed7e7ca262cf1bdc4a553f8de7ec"
  "SKIP"
)
arch=('amd64')
depends=("libxcb-cursor0")
maintainer=("DavidoTek <54072917+DavidoTek@users.noreply.github.com>" "xdavius <xdavius@github.com>")

package() {
  install -Dm755 "ProtonUp-Qt-${pkgver}-x86_64.AppImage" "${pkgdir}/usr/bin/${gives}"
  install -Dm644 "${srcdir}/net.davidotek.pupgui2.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${gives}.png"
  mkdir -p "${pkgdir}/usr/share/applications"
  echo "[Desktop Entry]
Name=ProtonUp-Qt
Icon=${gives}
Exec=env APPIMAGELAUNCHER_DISABLE=1 ${gives}
Type=Application
Categories=Game;Utility;
Terminal=false
X-AppImage-Version=${pkgver}" | tee "${pkgdir}/usr/share/applications/net.davidotek.pupgui2.desktop" > /dev/null
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/usr/bin/${gives}" "${pkgdir}/usr/bin/protonup-qt"
}
