name="yabridge"
version="5.0.4"
url="https://github.com/robbert-vdh/yabridge/releases/download/${version}/yabridge-${version}.tar.gz"
description="A modern and transparent way to use Windows VST2 and VST3 plugins on Linux."
hash="fb08b22fe0c75dd8a508420b4a1c2cc925a225e6fdb62f9e564da8db9620739f"
optdepends=("wine: 32-bit windows emulator"
  "wine64: 64-bit windows emulator")
maintainer="echometerain <echometer@disroot.org>"
repology=("project: yabridge")

install() {
  sudo install -dm755 "${pkgdir}/usr/bin"
  sudo install yabridgectl "${pkgdir}/usr/bin"
  sudo install yabridge-host{,-32}.exe{,.so} "${pkgdir}/usr/bin"

  sudo install -dm755 "${pkgdir}/usr/lib"
  sudo install libyabridge{,-chainloader}-{vst2,vst3,clap}.so "${pkgdir}/usr/lib"
}
