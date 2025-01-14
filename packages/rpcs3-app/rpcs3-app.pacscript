pkgname="rpcs3-app"
gives="rpcs3"
arch=("amd64" "arm64")
pkgver="0.0.34-17339"
pkgsha="1b87e186c45a21de83e9fdc859af3e0c92ae8509"
source=(
  "https://rpcs3.net/cdn/branding/core-color-png.png"
)
source_amd64=("https://github.com/RPCS3/rpcs3-binaries-linux/releases/download/build-${pkgsha}/rpcs3-v${pkgver}-${pkgsha:0:8}_linux64.AppImage")
source_arm64=("https://github.com/RPCS3/rpcs3-binaries-linux-arm64/releases/download/build-${pkgsha}/rpcs3-v${pkgver}-${pkgsha:0:8}_linux_aarch64.AppImage")
url="https://rpcs3.net"
pkgdesc="PS3 emulator/debugger"
maintainer=("Thomas Crha <thomas@9bitbyte.com>")
sha256sums=('SKIP')
sha256sums_amd64=("991a851a84e302a5a898f88a160fcf45e3b49d4dd6c26d2b174ad7ed4b38260a")
sha256sums_arm64=("b3cb4aa87b0b44cd170410681e7ca987a09c455690efbf39dc4f8e9b35eff3fe")

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
