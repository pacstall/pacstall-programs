pkgname="kdenlive-app"
gives="kdenlive"
arch=("amd64")
pkgver="24.12.3"
url='https://kdenlive.org'
pkgdesc="Free and Open Source Video Editor from KDE"
maintainer=("James Ed Randson <jimedrand@disroot.org>")
source=("https://download.kde.org/stable/${gives}/24.12/linux/${gives}-${pkgver}-x86_64.AppImage")
sha256sums=("fe3b07dc951ba2f348862bdfdccc9738ea0da02c2c80e85e23f33bcdff63975a")

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
