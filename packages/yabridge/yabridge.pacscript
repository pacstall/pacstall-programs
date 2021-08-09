name="yabridge"
version="3.5.2"
url="https://github.com/robbert-vdh/yabridge/releases/download/$version/yabridge-$version.tar.gz"
build_depends="libxcb1 libxcb1:i386"
description="A modern and transparent way to use Windows VST2 and VST3 plugins on Linux."
hash="5bbe1fc653f511ff84797037bd44dd17375d7fab69cb601446e855ae1a1b4816"
optdepends=("wine: 32-bit windows emulator"
"wine64: 64-bit windows emulator")
maintainer="rain1598 <guacamolek@yandex.com>"
prepare() {
          sudo install -D ./* -t "$STOWDIR/$name/usr/lib/yabridge"
}

build() {
          true
}

install() {
          sudo install -D ./yabridgectl -t "$STOWDIR/$name/usr/bin"
          sudo install -D ./yabridge-host.exe -t "$STOWDIR/$name/usr/bin"
          sudo install -D ./yabridge-host.exe.so -t "$STOWDIR/$name/usr/bin"
}

postinst(){
          yabridgectl set --path=/usr/lib/yabridge
}
