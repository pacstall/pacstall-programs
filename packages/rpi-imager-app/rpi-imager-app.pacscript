pkgname="rpi-imager-app"
gives="rpi-imager"
arch=("amd64" "arm64")
pkgver="1.9.4"
pkgdesc="The home of Raspberry Pi Imager, a user-friendly tool for creating bootable media for Raspberry Pi devices"
maintainer=("James Ed Randson <jimedrand@disroot.org>")
source_amd64=("https://github.com/raspberrypi/${gives}/releases/download/v${pkgver}/Raspberry_Pi_Imager-${pkgver}-x86_64.AppImage")
sha256sums_amd64=("80643c8556ee468b6fa2e84f4642790f8e16495352cef171c59b453e6693bf7e")
source_arm64=("https://github.com/raspberrypi/${gives}/releases/download/v${pkgver}/Raspberry_Pi_Imager-${pkgver}-aarch64.AppImage")
sha256sums_arm64=("b4eb066e04e1fcbde1bda65612a025f5197a663b7a1b4981af53c4e0ce8a9f53")

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
