pkgname="galaxybudsclient-bin"
gives="galaxybudsclient"
pkgver="5.0.1"
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
sha256sums_amd64=('e488526d9d062655db12748bdef8bed8f4e5b443bcdf76e534a8c83dab99ce25')
sha256sums_arm64=('18c5f81974556da3b0c6855f59b836fdcaa09cbd0b052f6b33b9913a3853ce0a')
sha256sums_armhf=('862e8cfb3096cb1ae0af53633a9ae2e6b0a07474a796c576d39880eadc1a52a8')
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
