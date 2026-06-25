pkgname="abdownloadmanager"
repology=("project: ${pkgname}")
arch=('amd64')
pkgver="1.9.2"
source=("https://github.com/amir1376/ab-download-manager/releases/download/v${pkgver}/ABDownloadManager_${pkgver}_linux_x64.tar.gz")
pkgdesc="Desktop app which lets you manage and organize your download files better than before"
sha256sums=("f80bbb0db2e34649bbccb20fd1f9767c395de8eca70cb11f30f168350577e888")
maintainer=("villamorrd <villamorrd@students.nu-moa.edu.ph>")
license=('Apache-2.0')

prepare() {
  mkdir -p "${pkgdir}/opt/abdownloadmanager"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/applications"
}

package() {
  cp -R ABDownloadManager/* "${pkgdir}/opt/abdownloadmanager"
  install -Dm644 ABDownloadManager/lib/ABDownloadManager.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  ln -sf "/opt/abdownloadmanager/bin/ABDownloadManager" "${pkgdir}/usr/bin/abdownloadmanager"

  cat << EOF > "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  [Desktop Entry]
Name=ABDownloadManager
Comment=ABDownloadManager
Exec=SKIKO_RENDER_API=SOFTWARE_FAST abdownloadmanager
Icon=abdownloadmanager
Terminal=false
Type=Application
Categories=AB Download Manager
MimeType=
EOF
}
