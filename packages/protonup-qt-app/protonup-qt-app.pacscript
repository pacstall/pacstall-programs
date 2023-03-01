name="protonup-qt-app"
pkgname="net.davidotek.pupgui2"
version="2.7.7"
gives="protonup-qt"
description="Install and manage Proton-GE and Luxtorpeda for Steam and Wine-GE for Lutris"
url="https://github.com/DavidoTek/ProtonUp-Qt/releases/download/v${version}/ProtonUp-Qt-${version}-x86_64.AppImage"
hash="7838b5dc3612e11b63de8bae851a044f50ad7380fba79d2486a5cd392048beda"
maintainer="DavidoTek <54072917+DavidoTek@users.noreply.github.com>"

install() {
  sudo install -Dm755 "ProtonUp-Qt-${version}-x86_64.AppImage" "${pkgdir}/usr/bin/${pkgname}"
  wget -q https://raw.githubusercontent.com/DavidoTek/ProtonUp-Qt/main/share/icons/hicolor/256x256/apps/net.davidotek.pupgui2.png
  sudo install -Dm644 "net.davidotek.pupgui2.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
  sudo mkdir -p "${pkgdir}/usr/share/applications"
  echo "[Desktop Entry]
Name=ProtonUp-Qt
Icon=${pkgname}
Exec=${pkgname}
Type=Application
Categories=Game;Utility;
Terminal=false
X-AppImage-Version=${version}" | sudo tee "${pkgdir}/usr/share/applications/net.davidotek.pupgui2.desktop" > /dev/null
}

postinst() {
  sudo ln -s "/usr/bin/${pkgname}" "/usr/bin/protonup-qt"
}

removescript() {
  sudo rm -f "/usr/bin/protonup-qt"
}
