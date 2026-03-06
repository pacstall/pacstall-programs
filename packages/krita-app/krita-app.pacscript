pkgname="krita-app"
gives="krita"
arch=("amd64")
pkgver="5.2.15"
url='https://krita.org'
pkgdesc="Professional free and open source painting program from KDE"
maintainer=("harrietobrien <harrietobrien@protonmail.com>" "James Ed Randson <jimedrand@disroot.org>")
source=("https://download.kde.org/stable/${gives}/${pkgver}/${gives}-${pkgver}-x86_64.AppImage")
sha256sums=("9064dbf926c90ce6cfa1a20ad94648db03e72676d9d1ad60b32f61f4c40f28ea")

package() {
  install -Dm755 "${gives}-${pkgver}-x86_64.AppImage" "${pkgdir}/usr/bin/krita"
  install -d "${pkgdir}/usr/share/applications"
  cat << EOF > "${pkgdir}/usr/share/applications/krita.desktop"
[Desktop Entry]
Type=Application
Name=Krita
Comment=Professional free and open source painting program from KDE
Exec=env APPIMAGELAUNCHER_DISABLE=1 /usr/bin/krita %f
Icon=krita
Terminal=false
Categories=Application;Graphics;Painting;Editor;
EOF
}
