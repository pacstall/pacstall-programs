pkgname="yabridge"
arch=("any")
pkgver="5.0.5"
source=("@${pkgname}~${pkgver}::https://github.com/robbert-vdh/yabridge/releases/download/${pkgver}/yabridge-${pkgver}.tar.gz")
pkgdesc="A modern and transparent way to use Windows VST2 and VST3 plugins on Linux."
sha256sums=("3ddc6e0989dad93e0275a83362fcfc0cb26b6dbfb8be7fc689410c02eb36455f")
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
