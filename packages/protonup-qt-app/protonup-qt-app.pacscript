name="protonup-qt-app"
pkgname="net.davidotek.pupgui2"
pkgver="2.8.2"
gives="protonup-qt"
pkgdesc="Install and manage Proton-GE and Luxtorpeda for Steam and Wine-GE for Lutris"
source=(
  "https://github.com/DavidoTek/ProtonUp-Qt/releases/download/v${pkgver}/ProtonUp-Qt-${pkgver}-x86_64.AppImage"
  "https://raw.githubusercontent.com/DavidoTek/ProtonUp-Qt/main/share/icons/hicolor/256x256/apps/net.davidotek.pupgui2.png"
)
hash=("cbb3e861b641c24a21a9511bfef184d01f134c2b4c9dc648a33001b34289a4bd" "SKIP")
arch=('amd64')
maintainer="DavidoTek <54072917+DavidoTek@users.noreply.github.com>"

package() {
  sudo install -Dm755 "ProtonUp-Qt-${pkgver}-x86_64.AppImage" "${pkgdir}/usr/bin/${pkgname}"
  sudo install -Dm644 "net.davidotek.pupgui2.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
  sudo mkdir -p "${pkgdir}/usr/share/applications"
  echo "[Desktop Entry]
Name=ProtonUp-Qt
Icon=${pkgname}
Exec=${pkgname}
Type=Application
Categories=Game;Utility;
Terminal=false
X-AppImage-Version=${pkgver}" | sudo tee "${pkgdir}/usr/share/applications/net.davidotek.pupgui2.desktop" > /dev/null
}

post_install() {
  sudo ln -s "/usr/bin/${pkgname}" "/usr/bin/protonup-qt"
}

post_remove() {
  sudo rm -f "/usr/bin/protonup-qt"
}
