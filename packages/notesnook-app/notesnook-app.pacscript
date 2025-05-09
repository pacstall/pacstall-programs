pkgname="notesnook-app"
repology=("project: notesnook")
arch=('amd64' 'arm64')
pkgver="3.0.30"
url='https://notesnook.com'
gives="notesnook"
source=("https://raw.githubusercontent.com/streetwriters/notesnook/refs/tags/v${pkgver}/resources/icon.png")
source_amd64=("${gives}-${pkgver}.AppImage::https://github.com/streetwriters/notesnook/releases/download/v${pkgver}/notesnook_linux_x86_64.AppImage")
source_arm64=("${gives}-${pkgver}.AppImage::https://github.com/streetwriters/notesnook/releases/download/v${pkgver}/notesnook_linux_arm64.AppImage")
sha256sums=('SKIP')
sha256sums_amd64=("0b5cec705beba3d5d16781acaab280f0fa4a6255532559bbff370cd4d46e7526")
sha256sums_arm64=("e47b35dd0423a929bbb4e4b78c37f2d002c0da833305dc585a31e88eac58d35f")
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
Exec=env APPIMAGELAUNCHER_DISABLE=1 /usr/bin/notesnook
Comment=An end-to-end encrypted note taking alternative to Evernote
Categories=Utility;
Terminal=false
EOF
}
