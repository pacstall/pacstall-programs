pkgname="digikam-app"
gives="digikam"
arch=("amd64")
pkgver="8.7.0"
url='https://www.digikam.org'
pkgdesc="Professional Photo Management with the Power of Open Source from KDE"
maintainer=("James Ed Randson <jimedrand@disroot.org>")
source=("https://download.kde.org/stable/${gives}/${pkgver}/digiKam-${pkgver}-Qt6-x86-64.appimage")
sha256sums=("4a75c235cb25121a2455bd85429fa6f230f37c0872aa4364e8efe50ec0b02309")

package() {
  install -Dm755 "digiKam-${pkgver}-Qt6-x86-64.appimage" "${pkgdir}/usr/bin/digikam"
  install -d "${pkgdir}/usr/share/applications"
  cat << EOF > "${pkgdir}/usr/share/applications/digikam.desktop"
[Desktop Entry]
Type=Application
Name=digiKam
Comment=Professional Photo Management with the Power of Open Source from KDE
Exec=env APPIMAGELAUNCHER_DISABLE=1 /usr/bin/digikam %f
Icon=digikam
Terminal=false
Categories=Application;Graphics;Photography;Viewer;
EOF
}
