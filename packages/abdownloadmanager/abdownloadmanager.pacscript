pkgname="abdownloadmanager"
arch=('amd64' 'arm64')
pkgver="1.10.1"
pkgdesc="Desktop app which lets you manage and organize your download files better than before"
source_amd64=("https://github.com/amir1376/ab-download-manager/releases/download/v${pkgver}/ABDownloadManager_${pkgver}_linux_x64.tar.gz")
source_arm64=("https://github.com/amir1376/ab-download-manager/releases/download/v${pkgver}/ABDownloadManager_${pkgver}_linux_arm64.tar.gz")
sha256sums_amd64=("daae532dfc07231dae02fce371a66b50e6c1ef4ca94a705bb3b5f2b996825ee7")
sha256sums_arm64=("9d4add145477a28c339d8db938997d82eb2200851feab5ac432926359794a3e3")
maintainer=("villamorrd <villamorrd@students.nu-moa.edu.ph>")
repology=("project: ab-download-manager")
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
Name=AB Download Manager
Comment=Manage and organize your download files better than before
GenericName=Downloader
Categories=Utility;Network;
Exec=abdownloadmanager
Icon=abdownloadmanager
Terminal=false
Type=Application
StartupWMClass=com-abdownloadmanager-desktop-AppKt
EOF
}
