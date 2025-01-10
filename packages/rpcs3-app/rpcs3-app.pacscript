pkgname="rpcs3-app"
gives="rpcs3"
arch=("amd64" "arm64")
pkgver="0.0.34-17335"
pkgsha_amd64="27c56cde2241b0056df7433a8fbb040bdb95dc07"
pkgsha_arm64="27c56cde2241b0056df7433a8fbb040bdb95dc07"
source=(
  "https://rpcs3.net/cdn/branding/core-color-png.png"
)
source_amd64=("https://github.com/RPCS3/rpcs3-binaries-linux/releases/download/build-${pkgsha_amd64}/rpcs3-v${pkgver}-${pkgsha_amd64:0:8}_linux64.AppImage")
source_arm64=("https://github.com/RPCS3/rpcs3-binaries-linux-arm64/releases/download/build-${pkgsha_arm64}/rpcs3-v${pkgver}-${pkgsha_arm64:0:8}_linux_aarch64.AppImage")
url="https://rpcs3.net"
pkgdesc="PS3 emulator/debugger"
maintainer=("Thomas Crha <thomas@9bitbyte.com>")
sha256sums=('SKIP')
sha256sums_amd64=("1b15144bf845a99e2ad40473df7d3e0b8e5dd2fd60ca79cacfa834450fed2db9")
sha256sums_arm64=("3228b7229d7cb454f7e7a9a605106a081122650b742b68867ad2a6834f1a811f")

prepare() {
  mkdir -p "${pkgdir}/usr/share/applications"
}

package() {
  if [[ ${CARCH} == "amd64" ]]; then
    install -Dm755 "rpcs3-v${pkgver}-${pkgsha_amd64:0:8}_linux64.AppImage" "${pkgdir}/usr/bin/rpcs3"
  else
    install -Dm755 "rpcs3-v${pkgver}-${pkgsha_arm64:0:8}_linux_aarch64.AppImage" "${pkgdir}/usr/bin/rpcs3"
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
