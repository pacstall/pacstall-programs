pkgname="rpi-imager-app"
gives="rpi-imager"
arch=("amd64" "arm64")
pkgver="1.9.0"
pkgdesc="The home of Raspberry Pi Imager, a user-friendly tool for creating bootable media for Raspberry Pi devices"
maintainer=("James Ed Randson <jimedrand@disroot.org>")
source_amd64=("https://github.com/raspberrypi/${gives}/releases/download/v${pkgver}/Raspberry_Pi_Imager-${pkgver}-x86_64.AppImage")
sha256sums_amd64=("26e837a758776d8a6cec7b92262d73188bcecee20c48cff066d05adef2dc555f")
source_arm64=("https://github.com/raspberrypi/${gives}/releases/download/v${pkgver}/Raspberry_Pi_Imager-${pkgver}-aarch64.AppImage")
sha256sums_arm64=("761053904ee29ad0b91bfe4418424b383d0a47ff4920544d8e81f9d87e8f81e8")

package() {
  if [[ ${CARCH} == amd64 ]]; then
    gnuarch="x86_64"
  else
    gnuarch="aarch64"
  fi

  install -Dm755 "Raspberry_Pi_Imager-${pkgver}-${gnuarch}.AppImage" "${pkgdir}/usr/bin/rpi-imager"
  install -d "${pkgdir}/usr/share/applications"
  cat << EOF > "${pkgdir}/usr/share/applications/rpi-imager.desktop"
[Desktop Entry]
Type=Application
Name=Raspberry Pi Imager
Comment=User-friendly tool for creating bootable media for Raspberry Pi devices
Exec=/usr/bin/rpi-imager
Icon=rpi-imager
Terminal=false
Categories=Application;Utilities
EOF
}
