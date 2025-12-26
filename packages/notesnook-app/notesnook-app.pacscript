pkgname="notesnook-app"
repology=("project: notesnook")
arch=('amd64' 'arm64')
pkgver="3.2.2"
url='https://notesnook.com'
gives="notesnook"
source=("https://raw.githubusercontent.com/streetwriters/notesnook/refs/tags/v${pkgver}/resources/icon.png")
source_amd64=("${gives}-${pkgver}.AppImage::https://github.com/streetwriters/notesnook/releases/download/v${pkgver}/notesnook_linux_x86_64.AppImage")
source_arm64=("${gives}-${pkgver}.AppImage::https://github.com/streetwriters/notesnook/releases/download/v${pkgver}/notesnook_linux_arm64.AppImage")
sha256sums=('SKIP')
sha256sums_amd64=("0ae3a65bd9034e533dfee4c52acb8d49f91827a38d2368d9e32b62296fc722c1")
sha256sums_arm64=("79d586d378def4ba5844cea23ab51c910c678cc8aea622cc8ce95e40d30824e0")
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
