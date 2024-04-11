pkgname="upscayl-app"
gives="upscayl"
pkgver="2.5.5"
pkgdesc="Free and Open Source AI Image Upscaler for Linux, MacOS and Windows"
maintainer=("0x262D <pacstall@copypaste.anonaddy.me>")
source=(
  "https://github.com/TGS963/${gives}/releases/download/v${pkgver}/Upscayl-${pkgver}-linux.AppImage"
  "${gives}.desktop::https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${pkgname}/${gives}.desktop"
  "${gives}.png::https://raw.githubusercontent.com/TGS963/${gives}/main/main/build/icon.png"
)
sha256sums=(
  "aa92f1386a6147d887bed6fc01965a32272dfe0f302e42fb0e1af89addcb65d9"
  "SKIP"
  "SKIP"
)
breaks=("${gives}" "${gives}-deb" "${gives}-bin" "${gives}-git")
repology=("project: ${gives}")

package() {
  cd "${_archive}"
  # Install appimage
  install -Dm755 "Upscayl-${pkgver}-linux.AppImage" "${pkgdir}/usr/bin/${gives}"

  # Download icon
  install -Dm644 "${srcdir}/${gives}.png" "${pkgdir}/usr/share/pixmaps/${gives}.png"

  # Install .desktop file
  install -Dm644 "${srcdir}/${gives}.desktop" "${pkgdir}/usr/share/applications/${gives}.desktop"
}
# vim:set ft=sh ts=2 sw=2 et:
