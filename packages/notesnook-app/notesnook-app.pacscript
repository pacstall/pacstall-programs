pkgname="notesnook-app"
repology=("project: notesnook")
arch=('amd64' 'arm64')
pkgver="3.3.8"
url='https://notesnook.com'
gives="notesnook"
source=("https://raw.githubusercontent.com/streetwriters/notesnook/refs/tags/v${pkgver}/resources/icon.png")
source_amd64=("${gives}-${pkgver}.AppImage::https://github.com/streetwriters/notesnook/releases/download/v${pkgver}/notesnook_linux_x86_64.AppImage")
source_arm64=("${gives}-${pkgver}.AppImage::https://github.com/streetwriters/notesnook/releases/download/v${pkgver}/notesnook_linux_arm64.AppImage")
sha256sums=('SKIP')
sha256sums_amd64=("ee03c2982deea25e6e930bbc38e861aa4f690538168c8d78c1898ceb59e583e0")
sha256sums_arm64=("2665adef2aff223d35c7b6d359443b500c0a7047fd8bdd5f659b07a445912586")
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
