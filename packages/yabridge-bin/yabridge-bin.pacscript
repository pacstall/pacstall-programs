name="yabridge-bin"
version="3.5.0"
url="https://github.com/robbert-vdh/yabridge/releases/download/$version/yabridge-$version.tar.gz"
build_depends="libxcb1 libxcb1:i386"
breaks="yabridge-lts-bin"
description="A modern and transparent way to use Windows VST2 and VST3 plugins on Linux."
hash="3294525bf98857f6bd373b54951086fd3327c3eff8d8eeb550f1ace8a34e466b"
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
