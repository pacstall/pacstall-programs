name="galaxybudsclient-bin"
pkgname="galaxybudsclient"
pkgver="4.5.2"
pkgdesc="Unofficial Galaxy Buds Manager for Windows and Linux"
homepage="https://github.com/ThePBone/GalaxyBudsClient"
arch=("amd64" "arm64" "armhf")
maintainer="Vigress <vig@disroot.org>"

case "${CARCH}" in
  amd64)
    url="https://github.com/ThePBone/GalaxyBudsClient/releases/download/${pkgver}/GalaxyBudsClient_Linux_64bit_Portable.bin"
    hash="8e07ebbcf4cd4e2700e319ed146de8a7e4cd5b28ffdc24a3d4340c294f0a6274"
    ;;
  arm64)
    url="https://github.com/ThePBone/GalaxyBudsClient/releases/download/${pkgver}/GalaxyBudsClient_Linux_arm64_Portable.bin"
    hash="846d222c288c0b88daedd4a1a585d9b10cea95be88ea4ea62627e2d895a5c6bf"
    ;;
  armhf)
    url="https://github.com/ThePBone/GalaxyBudsClient/releases/download/${pkgver}/GalaxyBudsClient_Linux_arm_Portable.bin"
    hash="09cb2bde9390ef614a569da9eff49ac7a724af780cdcdaac4807a4239ba8ca98"
    ;;
  *) return 1 ;;
esac

package() {
  # Install icon
  wget -q -O "${pkgname}.png" "https://raw.githubusercontent.com/ThePBone/GalaxyBudsClient/master/GalaxyBudsClient/Resources/icon_white.png"
  sudo install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # Install desktop file
  wget -q "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${name}/${pkgname}.desktop"
  sudo install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install binary
  sudo install -Dm755 GalaxyBudsClient_Linux_*_Portable.bin "${pkgdir}/usr/bin/${pkgname}"
}
