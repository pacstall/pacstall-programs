pkgname="notesnook-app"
repology=("project: notesnook")
arch=('amd64' 'arm64')
pkgver="3.3.23"
url='https://notesnook.com'
gives="notesnook"
source=("https://raw.githubusercontent.com/streetwriters/notesnook/refs/tags/v${pkgver}/resources/icon.png")
source_amd64=("${gives}-${pkgver}.AppImage::https://github.com/streetwriters/notesnook/releases/download/v${pkgver}/notesnook_linux_x86_64.AppImage")
source_arm64=("${gives}-${pkgver}.AppImage::https://github.com/streetwriters/notesnook/releases/download/v${pkgver}/notesnook_linux_arm64.AppImage")
sha256sums=('SKIP')
sha256sums_amd64=("c49738761f754dcc6f07cdfae1b557a80ba9c97c599a928cceca1ee399869a12")
sha256sums_arm64=("337b01516b68781e3a25f129d6841ee136e9c29aa0a31b50df5dd16e64b46864")
pkgdesc="End-to-end encrypted note taking alternative to Evernote"
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
Exec=env APPIMAGELAUNCHER_DISABLE=1 /usr/bin/notesnook
Comment=An end-to-end encrypted note taking alternative to Evernote
Categories=Utility;
Terminal=false
EOF
}
