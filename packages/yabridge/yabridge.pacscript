name="yabridge"
version="5.0.3"
url="https://github.com/robbert-vdh/yabridge/releases/download/${version}/yabridge-${version}.tar.gz"
description="A modern and transparent way to use Windows VST2 and VST3 plugins on Linux."
hash="cb9114efae714bc7c63a3ee3ba311a2e32d4ce311310feadd0799679a72d537a"
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
