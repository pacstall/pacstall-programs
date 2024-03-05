name="upscayl-app"
pkgname="upscayl"
gives="upscayl"
pkgver="2.5.5"
pkgdesc="Free and Open Source AI Image Upscaler for Linux, MacOS and Windows"
maintainer="0x262D <pacstall@copypaste.anonaddy.me>"
source=(
  "https://github.com/TGS963/${gives}/releases/download/v${pkgver}/Upscayl-${pkgver}-linux.AppImage"
  "${pkgname}.png::https://raw.githubusercontent.com/TGS963/${gives}/main/main/build/icon.png"
  "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${name}/${pkgname}.desktop"
)
hash=(
  "aa92f1386a6147d887bed6fc01965a32272dfe0f302e42fb0e1af89addcb65d9"
  "SKIP" "SKIP"
)
breaks=("${pkgname}" "${pkgname}-deb" "${pkgname}-bin" "${pkgname}-git")
repology=("project: ${pkgname}")

package() {
  # Install appimage
  sudo install -Dm755 "Upscayl-${pkgver}-linux.AppImage" "${pkgdir}/usr/bin/${pkgname}"

  # Download icon
  sudo install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # Install .desktop file
  sudo install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
# vim:set ft=sh ts=2 sw=2 et:
