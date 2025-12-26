pkgname="yabridge"
arch=("any")
pkgver="5.1.1"
source=("@${pkgname}~${pkgver}::https://github.com/robbert-vdh/yabridge/releases/download/${pkgver}/yabridge-${pkgver}.tar.gz")
pkgdesc="A modern and transparent way to use Windows VST2 and VST3 plugins on Linux."
sha256sums=("d11f0307412b5566b09a75ed4aa191266db56d22f4de4d20e4fbde6296cd1a47")
optdepends=("wine: 32-bit windows emulator"
  "wine64: 64-bit windows emulator")
maintainer=("echometerain <echometer@disroot.org>")
repology=("project: yabridge")

package() {
  cd "${pkgname}~${pkgver}"
  install -dm755 "${pkgdir}/usr/bin"
  install yabridgectl "${pkgdir}/usr/bin"
  install yabridge-host{,-32}.exe{,.so} "${pkgdir}/usr/bin"

  install -dm755 "${pkgdir}/usr/lib"
  install libyabridge{,-chainloader}-{vst2,vst3,clap}.so "${pkgdir}/usr/lib"
}
