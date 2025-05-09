pkgname="krita-app"
gives="krita"
arch=("amd64")
pkgver="5.2.9"
url='https://krita.org'
pkgdesc="Professional free and open source painting program from KDE"
maintainer=("harrietobrien <harrietobrien@protonmail.com>" "James Ed Randson <jimedrand@disroot.org>")
source=("https://download.kde.org/stable/${gives}/${pkgver}/${gives}-${pkgver}-x86_64.AppImage")
sha256sums=("e81dedfdaf52d69daf280856265dcbca81b1c3cfab615a90147a9a63c132b308")

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
