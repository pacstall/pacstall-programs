pkgname="notesnook-app"
repology=("project: notesnook")
arch=('amd64' 'arm64')
pkgver="3.0.24"
url='https://notesnook.com'
gives="notesnook"
source=("https://raw.githubusercontent.com/streetwriters/notesnook/refs/tags/v${pkgver}/resources/icon.png")
source_amd64=("${gives}-${pkgver}.AppImage::https://github.com/streetwriters/notesnook/releases/download/v${pkgver}/notesnook_linux_x86_64.AppImage")
source_arm64=("${gives}-${pkgver}.AppImage::https://github.com/streetwriters/notesnook/releases/download/v${pkgver}/notesnook_linux_arm64.AppImage")
sha256sums=('SKIP')
sha256sums_amd64=("87c9c5f3adc4b095fbba8881f8c2b11c4340e49264d773905f00054c50003cb4")
sha256sums_arm64=("23e687dd9c92cd2e6f1a5b1bb2bf42bbf2541019bda58447e95d180fe12271b3")
pkgdesc="End-to-end encrypted note taking alternative to Evernote"
maintainer=("villamorrd <villamorrd@students.nu-moa.edu.ph>")
license=('GPL-3.0-only')

prepare() {
  mkdir -p "${pkgdir}/usr/share/applications"
}

package() {
  install -Dm755 "${gives}-${pkgver}.AppImage" "${pkgdir}/usr/bin/${gives}"
  install -Dm644 "icon.png" "${pkgdir}/usr/share/pixmaps/${gives}.png"

  cat << EOF > "${pkgdir}/usr/share/applications/${gives}.desktop"
  [Desktop Entry]
Type=Application
Name=Notesnook
Icon=notesnook
Exec=notesnook
Comment=An end-to-end encrypted note taking alternative to Evernote
Categories=Utility;
Terminal=false
EOF
}
