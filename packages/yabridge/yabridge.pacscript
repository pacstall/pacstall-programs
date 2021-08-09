name="yabridge"
version="3.5.1"
url="https://github.com/robbert-vdh/yabridge/releases/download/$version/yabridge-$version.tar.gz"
build_depends="libxcb1 libxcb1:i386"
description="A modern and transparent way to use Windows VST2 and VST3 plugins on Linux."
hash="e7d6e81117534f57082dbfdcb6b743ca12b9006747e82405171ec3729aa15622"
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
