pkgname="rpcs3-app"
gives="rpcs3"
arch=("amd64" "arm64")
pkgver="0.0.37-18022"
_pkgsha="9c93ec0bc31bbc94ca4dce2a76ceea80da6f6554"
source=(
  "https://rpcs3.net/cdn/branding/core-color-png.png"
)
source_amd64=("https://github.com/RPCS3/rpcs3-binaries-linux/releases/download/build-${_pkgsha}/rpcs3-v${pkgver}-${_pkgsha:0:8}_linux64.AppImage")
source_arm64=("https://github.com/RPCS3/rpcs3-binaries-linux-arm64/releases/download/build-${_pkgsha}/rpcs3-v${pkgver}-${_pkgsha:0:8}_linux_aarch64.AppImage")
url='https://rpcs3.net'
pkgdesc="PS3 emulator/debugger"
maintainer=("Thomas Crha <thomas@9bitbyte.com>")
sha256sums=('SKIP')
sha256sums_amd64=("c73b47d687a77b6b403f191fdc728e3f63b1fa7601d78471c5503af183e2b564")
sha256sums_arm64=("4ef3819fe6397a91cc7e2555063e1685e037d37920d9e0affcb86704883eab63")

prepare() {
  mkdir -p "${pkgdir}/usr/share/applications"
}

package() {
  if [[ ${CARCH} == "amd64" ]]; then
    install -Dm755 "rpcs3-v${pkgver}-${pkgsha:0:8}_linux64.AppImage" "${pkgdir}/usr/bin/rpcs3"
  else
    install -Dm755 "rpcs3-v${pkgver}-${pkgsha:0:8}_linux_aarch64.AppImage" "${pkgdir}/usr/bin/rpcs3"
  fi

  install -Dm644 "core-color-png.png" "${pkgdir}/usr/share/pixmaps/${gives}.png"
  echo "[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Name=RPCS3
Comment=RPCS3
Exec=rpcs3 %f
Icon=rpcs3
Terminal=false
Categories=Application;Game" | tee "${pkgdir}/usr/share/applications/${gives}.desktop" > /dev/null
}
# vim:set ft=sh ts=2 sw=2 et:
