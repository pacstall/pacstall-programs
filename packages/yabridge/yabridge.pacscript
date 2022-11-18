name="yabridge"
version="5.0.1"
url="https://github.com/robbert-vdh/yabridge/releases/download/${version}/yabridge-${version}.tar.gz"
build_depends="libxcb1 libxcb1:i386"
description="A modern and transparent way to use Windows VST2 and VST3 plugins on Linux."
hash="d4103354298261bb14bf672b5693959fcad8433e681ac52b49f90d56c661b5f3"
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
