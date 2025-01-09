pkgname="galaxybudsclient-bin"
gives="galaxybudsclient"
pkgver="5.1.0"
pkgdesc="Unofficial Galaxy Buds Manager for Windows and Linux"
repology=("project: galaxybudsclient")
url="https://github.com/timschneeb/GalaxyBudsClient"
arch=("amd64" "arm64" "armhf")
depends=("bluetooth")
maintainer=()

source_amd64=("${url}/releases/download/${pkgver}/GalaxyBudsClient_Linux_64bit_Portable.bin")
source_arm64=("${url}/releases/download/${pkgver}/GalaxyBudsClient_Linux_arm64_Portable.bin")
source_armhf=("${url}/releases/download/${pkgver}/GalaxyBudsClient_Linux_arm_Portable.bin")
source=("${url}/blob/${pkgver}/GalaxyBudsClient/Resources/icon.png?raw=true")
sha256sums_amd64=('09dfdb8f6a5f7ffc38a5fda9ca99311acf3ac56454d00b3105b59282a841857e')
sha256sums_arm64=('e7d0ef2b8b8ac496e7d7f257e655ceefe083dfdd65b3c45cc5578572479bc892')
sha256sums_armhf=('e15a9eb81ccb7c0ea38694bd26121484b4f9ab2219b5f97d895f10bad5921d3b')
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
