name="yabridge"
version="4.0.2"
url="https://github.com/robbert-vdh/yabridge/releases/download/${version}/yabridge-${version}.tar.gz"
build_depends="libxcb1 libxcb1:i386"
description="A modern and transparent way to use Windows VST2 and VST3 plugins on Linux."
hash="e9b66d48339cec5f3cc929d1da37d73c78c04d98281d051a2cbbe20dfb8f9eba"
optdepends=("wine: 32-bit windows emulator"
  "wine64: 64-bit windows emulator")
maintainer="echometerain <echometer@disroot.org>"
repology=("project: yabridge")

prepare() {
  true
}

build() {
  true
}

install() {
  sudo install -dm755 "$pkgdir/usr/bin"
  sudo install yabridgectl "$pkgdir/usr/bin"
  sudo install yabridge-host{,-32}.exe{,.so} "$pkgdir/usr/bin"

  sudo install -dm755 "$pkgdir/usr/lib"
  sudo install libyabridge{,-chainloader}-{vst2,vst3}.so "$pkgdir/usr/lib"
}
