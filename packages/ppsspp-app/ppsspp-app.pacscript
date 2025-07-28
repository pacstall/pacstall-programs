pkgname="ppsspp-app"
gives="ppsspp"
repology=("project: ppsspp")
arch=('amd64' 'arm64')
pkgver="1.19.3"
url='https://www.ppsspp.org'
source=("https://raw.githubusercontent.com/hrydgard/ppsspp/refs/tags/v${pkgver}/ppsspp.desktop.in")
source_amd64=("${gives}.AppImage::https://github.com/hrydgard/ppsspp/releases/download/v${pkgver}/PPSSPP-v${pkgver}-anylinux-x86_64.AppImage")
source_arm64=("${gives}.AppImage::https://github.com/hrydgard/ppsspp/releases/download/v${pkgver}/PPSSPP-v${pkgver}-anylinux-aarch64.AppImage")
sha256sums=("0221b1fa71ec7bbbf4f2f8eb2753ebb45ab7b934b1c86569757ad385d34a6d3c")
sha256sums_amd64=("540f317c1ed6661894167d2dce21b62295857e1a912274982da7048cf2256466")
sha256sums_arm64=("ba0b659df9405fda8e7f394e28282b71ab1e15f829fab1c57c1d423c5a50cefe")
conflicts=("${gives}-git")
replaces=("${gives}-git")
pkgdesc="PSP emulator"
maintainer=("villamorrd <villamorrd@students.nu-moa.edu.ph>")
license=('GPL-2.0-or-later')

prepare() {
  mkdir -p "${pkgdir}/opt"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/applications"
}

package() {
  install -Dm755 "${gives}.AppImage" -t "${pkgdir}/opt"
  ln -s "/opt/${gives}.AppImage" "${pkgdir}/usr/bin/${gives}"

  install -Dm755 "${gives}.desktop.in" "${pkgdir}/usr/share/applications/${gives}.desktop"
  desktop-file-edit \
    --set-key=Name --set-value="PPSSPP" \
    --set-key=Exec --set-value="env APPIMAGELAUNCHER_DISABLE=1 ${gives}" \
    "${pkgdir}/usr/share/applications/${gives}.desktop"
}
