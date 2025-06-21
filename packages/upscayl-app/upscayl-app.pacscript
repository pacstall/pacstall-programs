pkgname="upscayl-app"
gives="upscayl"
arch=("amd64")
pkgver="2.15.0"
pkgdesc="Free and Open Source AI Image Upscaler for Linux, MacOS and Windows"
maintainer=("0x262D <pacstall@copypaste.anonaddy.me>")
source=(
  "https://github.com/TGS963/${gives}/releases/download/v${pkgver}/Upscayl-${pkgver}-linux.AppImage"
  "${gives}.desktop::https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${pkgname}/${gives}.desktop"
  "${gives}.svg::https://raw.githubusercontent.com/upscayl/upscayl/main/docs/logo/logo.svg"
)
sha256sums=(
  "6459457e589bcb99e779ea442dce608bacda33916b7019a8862b7c6252aa8229"
  "SKIP"
  "SKIP"
)
breaks=("${gives}" "${gives}-deb" "${gives}-bin" "${gives}-git")
repology=("project: ${gives}")

package() {
  cd "${srcdir}"
  # Install appimage
  install -Dm755 "Upscayl-${pkgver}-linux.AppImage" "${pkgdir}/usr/bin/${gives}"

  # Download icon
  install -Dm644 "${srcdir}/${gives}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${gives}.svg"

  # Install .desktop file
  install -Dm644 "${srcdir}/${gives}.desktop" "${pkgdir}/usr/share/applications/${gives}.desktop"
}
# vim:set ft=sh ts=2 sw=2 et:
