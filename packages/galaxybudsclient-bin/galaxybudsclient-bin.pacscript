pkgname="galaxybudsclient-bin"
gives="galaxybudsclient"
pkgver="5.0.0"
pkgdesc="Unofficial Galaxy Buds Manager for Windows and Linux"
repology=("project: galaxybudsclient")
url="https://github.com/timschneeb/GalaxyBudsClient"
arch=("amd64" "arm64" "armhf")
depends=("bluetooth")
maintainer=("vigress8 <vig@disroot.org>")

source_amd64=("${url}/releases/download/${pkgver}/GalaxyBudsClient_Linux_64bit_Portable.bin")
source_arm64=("${url}/releases/download/${pkgver}/GalaxyBudsClient_Linux_arm64_Portable.bin")
source_armhf=("${url}/releases/download/${pkgver}/GalaxyBudsClient_Linux_arm_Portable.bin")
source=("${url}/blob/${pkgver}/GalaxyBudsClient/Resources/icon.png?raw=true")
sha256sums_amd64=('26f2caecf29db865f63fcc94d3b3fc5e61a5a10e5c3eb3895fedb3d694ac815e')
sha256sums_arm64=('eeedf6979aa1636fbc5c984ce38b1c14586f63996795c3b40c9bf4e8d8d08a08')
sha256sums_armhf=('8ef02d29c182679b10d619b39573df10f1b8506fb9e398d7d91a13bc210ddea9')
sha256sums=('15783ad016b4fc50395456da8bd4838441582f5394a0731c0038fdc692289d51')

package() {
  # Install icon
  install -Dm644 icon.png "${pkgdir}/usr/share/pixmaps/${gives}.png"

  # Install desktop file
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${gives}.desktop" << EOF
[Desktop Entry]
Name=Galaxy Buds Client
Comment=${pkgdesc}
Exec=${gives}
Icon=${gives}
Type=Application
Categories=Utility;
Keywords=samsung;galaxy;buds;headphone;bluetooth;
EOF

  # Install binary
  install -Dm755 ./*.bin "${pkgdir}/usr/bin/${gives}"
}
