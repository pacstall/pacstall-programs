name="galaxybudsclient-bin"
gives="galaxybudsclient"
pkgver="4.5.4"
pkgdesc="Unofficial Galaxy Buds Manager for Windows and Linux"
repology=("project: galaxybudsclient")
homepage="https://github.com/ThePBone/GalaxyBudsClient"
arch=("amd64" "arm64" "armhf")
depends=("bluetooth")
maintainer="vigress8 <vig@disroot.org>"
source=(
  "${gives}.png::https://raw.githubusercontent.com/ThePBone/GalaxyBudsClient/master/GalaxyBudsClient/Resources/icon_white.png"
  "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${name}/${gives}.desktop"
)
source_amd64=("https://github.com/ThePBone/GalaxyBudsClient/releases/download/${pkgver}/GalaxyBudsClient_Linux_64bit_Portable.bin")
source_arm64=("https://github.com/ThePBone/GalaxyBudsClient/releases/download/${pkgver}/GalaxyBudsClient_Linux_arm64_Portable.bin")
source_armhf=("https://github.com/ThePBone/GalaxyBudsClient/releases/download/${pkgver}/GalaxyBudsClient_Linux_arm_Portable.bin")
hash=('SKIP' 'SKIP')
hash_amd64=("d1d859ade65e87bcb4acae6e97661cbb1941d2630093ca9e6ee92f1ec2b13fa7")
hash_arm64=("9476e7f93f6b60c1922e4a5fa51bc867326ddd5f9d43792d3aea07d65174506a")
hash_armhf=("49c836631b9408cc737f9de91c41c48f73d0703655adeba9cbecda4387f0bfef")

package() {
  # Install icon
  sudo install -Dm644 "${gives}.png" "${pkgdir}/usr/share/pixmaps/${gives}.png"

  # Install desktop file
  sudo install -Dm644 "${gives}.desktop" "${pkgdir}/usr/share/applications/${gives}.desktop"

  # Install binary
  sudo install -Dm755 GalaxyBudsClient_Linux_*_Portable.bin "${pkgdir}/usr/bin/${gives}"
}
