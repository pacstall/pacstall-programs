pkgname="galaxybudsclient-bin"
gives="galaxybudsclient"
pkgver="5.2.1"
pkgdesc="Unofficial Galaxy Buds Manager for Windows and Linux"
repology=("project: galaxybudsclient")
url='https://github.com/timschneeb/GalaxyBudsClient'
arch=("amd64" "arm64" "armhf")
depends=("bluetooth")

source_amd64=("${url}/releases/download/${pkgver}/GalaxyBudsClient_Linux_64bit_Portable.bin")
source_arm64=("${url}/releases/download/${pkgver}/GalaxyBudsClient_Linux_arm64_Portable.bin")
source_armhf=("${url}/releases/download/${pkgver}/GalaxyBudsClient_Linux_arm_Portable.bin")
source=("${url}/blob/${pkgver}/GalaxyBudsClient/Resources/icon.png?raw=true")
sha256sums_amd64=('fa3b0889c2142821f10a2df2b359c7573106c2e0559c9465dd32d983ef1f9ae3')
sha256sums_arm64=('b3d8279ed888f05aeacd8aa7318c8635e4b1ae5ad44ffe3a0b5c55b43681ef0b')
sha256sums_armhf=('14e221110d64082dc44200f78edb98887aa91c0adf81f54a2158a3f1f5a0b0bd')
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
