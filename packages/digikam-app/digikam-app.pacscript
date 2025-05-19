pkgname="digikam-app"
gives="digikam"
arch=("amd64")
pkgver="8.6.0"
url='https://www.digikam.org'
pkgdesc="Professional Photo Management with the Power of Open Source from KDE"
maintainer=("James Ed Randson <jimedrand@disroot.org>")
source=("https://download.kde.org/stable/${gives}/${pkgver}/digiKam-${pkgver}-Qt6-x86-64.appimage")
sha256sums=("b99d732eb5daf78a2ea2e41569368fb4fadafbd807f138edb6be688e961e58c3")

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
