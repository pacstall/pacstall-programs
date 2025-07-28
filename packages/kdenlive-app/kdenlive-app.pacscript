pkgname="kdenlive-app"
gives="kdenlive"
arch=("amd64")
pkgver="25.04.3"
url='https://kdenlive.org'
pkgdesc="Free and Open Source Video Editor from KDE"
maintainer=("James Ed Randson <jimedrand@disroot.org>")
source=("https://download.kde.org/stable/${gives}/${pkgver%.*}/linux/${gives}-${pkgver}-x86_64.AppImage")
sha256sums=("57d488f5a484a52e8920e02b2c9263146b5665f4ab045abfd1a8631b2abf939a")
repology=("project: ${gives}")

package() {
  install -Dm755 "${gives}-${pkgver}-x86_64.AppImage" "${pkgdir}/usr/bin/kdenlive"
  install -d "${pkgdir}/usr/share/applications"
  cat << EOF > "${pkgdir}/usr/share/applications/kdenlive.desktop"
[Desktop Entry]
Type=Application
Name=Kdenlive
Comment=Free and Open Source Video Editor from KDE
Exec=env APPIMAGELAUNCHER_DISABLE=1 /usr/bin/kdenlive %f
Icon=kdenlive
Terminal=false
Categories=Application;Video;AudioVideo;Editor;
EOF
}
