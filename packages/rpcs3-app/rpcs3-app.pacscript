pkgname="rpcs3-app"
gives="rpcs3"
arch=("amd64" "arm64")
pkgver="0.0.34-17326"
pkgsha_amd64="9407974c105037a0617bdefe97b235f6226d8198"
pkgsha_arm64="9407974c105037a0617bdefe97b235f6226d8198"
source=(
  "https://rpcs3.net/cdn/branding/core-color-png.png"
  "rpcs3.desktop"
)
source_amd64=("https://github.com/RPCS3/rpcs3-binaries-linux/releases/download/build-${pkgsha_amd64}/rpcs3-v${pkgver}-${pkgsha_amd64:0:8}_linux64.AppImage")
source_arm64=("https://github.com/RPCS3/rpcs3-binaries-linux-arm64/releases/download/build-${pkgsha_arm64}/rpcs3-v${pkgver}-${pkgsha_arm64:0:8}_linux_aarch64.AppImage")
url="https://rpcs3.net"
pkgdesc="PS3 emulator/debugger"
maintainer=("Thomas Crha <thomas@9bitbyte.com>")
sha256sums=(
  'SKIP'
  'SKIP'
)
sha256sums_amd64=("1779a661eaf5100de8e1bf9cff1ed170816e18fcd13f689fc555f8720caea402")
sha256sums_arm64=("98629f6c6a93878352dcb4fcef5b1a231e7cd3705898bf2bd70698995a81f0ad")

package() {
  if [[ ${CARCH} == "amd64" ]]; then
    install -Dm755 "rpcs3-v${pkgver}-${pkgsha_amd64:0:8}_linux64.AppImage" "${pkgdir}/usr/bin/rpcs3"
  else
    install -Dm755 "rpcs3-v${pkgver}-${pkgsha_arm64:0:8}_linux_aarch64.AppImage" "${pkgdir}/usr/bin/rpcs3"
  fi

  install -Dm644 "core-color-png.png" "${pkgdir}/usr/share/pixmaps/${gives}.png"
  install -Dm644 "rpcs3.desktop" "${pkgdir}/usr/share/applications/${gives}.desktop"
}
# vim:set ft=sh ts=2 sw=2 et:
