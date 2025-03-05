pkgname="abdownloadmanager"
repology=("project: ${pkgname}")
arch=('amd64')
pkgver="1.5.3"
source=("https://github.com/amir1376/ab-download-manager/releases/download/v${pkgver}/ABDownloadManager_${pkgver}_linux_x64.tar.gz")
pkgdesc="Desktop app which lets you manage and organize your download files better than before"
sha256sums=("ab43c3010cd820ad50f7604c89b5dc75ea9e6a9fa6455416514e77403715931f")
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
