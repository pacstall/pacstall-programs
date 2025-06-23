pkgname="galaxybudsclient-bin"
gives="galaxybudsclient"
pkgver="5.1.2"
pkgdesc="Unofficial Galaxy Buds Manager for Windows and Linux"
repology=("project: galaxybudsclient")
url='https://github.com/timschneeb/GalaxyBudsClient'
arch=("amd64" "arm64" "armhf")
depends=("bluetooth")

source_amd64=("${url}/releases/download/${pkgver}/GalaxyBudsClient_Linux_64bit_Portable.bin")
source_arm64=("${url}/releases/download/${pkgver}/GalaxyBudsClient_Linux_arm64_Portable.bin")
source_armhf=("${url}/releases/download/${pkgver}/GalaxyBudsClient_Linux_arm_Portable.bin")
source=("${url}/blob/${pkgver}/GalaxyBudsClient/Resources/icon.png?raw=true")
sha256sums_amd64=('13e6dee834cff02ff772b8eaebdd5631e1e3e6556b365e6dbb0184c7fa68da00')
sha256sums_arm64=('51a1857faa24e52b2dc2b15e2839221bfac707826dac9e0235b9abd9d39d0abd')
sha256sums_armhf=('cb7c2b7b00a64886b9d04b4411cf47e2a531ccad718fe018fbd633ffe47aaa5a')
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
