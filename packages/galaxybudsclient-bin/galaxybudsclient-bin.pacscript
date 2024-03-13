name="galaxybudsclient-bin"
gives="galaxybudsclient"
pkgver="4.6.0"
pkgdesc="Unofficial Galaxy Buds Manager for Windows and Linux"
repology=("project: galaxybudsclient")
homepage="https://github.com/ThePBone/GalaxyBudsClient"
arch=("amd64" "arm64" "armhf")
depends=("bluetooth")
maintainer="vigress8 <vig@disroot.org>"

url="https://github.com/ThePBone/GalaxyBudsClient/releases/download/${pkgver}/GalaxyBudsClient_Linux-${CARCH/armhf/arm}_portable.zip"
case "${CARCH}" in
  amd64)
    hash="b3c4af4c56b2a023e289a1eb379e939c8cb786376adf971ac011a3060ff7f8db"
    ;;
  arm64)
    hash="f467063efd0344798564830e6ce1231380a960af715f6e7b1264d0223aaa7362"
    ;;
  armhf)
    hash="e6842fc6392312f8de568eb268aaf38d672f904995ba5c215dc23eddbff28d9f"
    ;;
  *) ;;
esac

package() {
  # Install icon
  wget -q -O "${gives}.png" "https://raw.githubusercontent.com/ThePBone/GalaxyBudsClient/master/GalaxyBudsClient/Resources/icon_white.png"
  sudo install -Dm644 "${gives}.png" -t "${pkgdir}/usr/share/pixmaps"

  # Install desktop file
  wget -q "https://raw.githubusercontent.com/pacstall/pacstall-programs/master/packages/${name}/${gives}.desktop"
  sudo install -Dm644 "${gives}.desktop" -t "${pkgdir}/usr/share/applications"

  # Install binary
  sudo install -Dm755 GalaxyBudsClient "${pkgdir}/usr/bin/${gives}"
}
