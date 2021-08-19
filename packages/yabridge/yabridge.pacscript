name="yabridge"
version="3.5.2"
url="https://github.com/robbert-vdh/yabridge/releases/download/$version/yabridge-$version.tar.gz"
build_depends="libxcb1 libxcb1:i386"
description="A modern and transparent way to use Windows VST2 and VST3 plugins on Linux."
hash="5bbe1fc653f511ff84797037bd44dd17375d7fab69cb601446e855ae1a1b4816"
optdepends=("wine: 32-bit windows emulator"
"wine64: 64-bit windows emulator")
maintainer="echometerain <echometer@disroot.org>"
prepare() {
          sudo install -D ./* -t "$STOWDIR/$name/usr/lib/yabridge"
}

build() {
          true
}

install() {
          sudo ln -s "$STOWDIR/$name/usr/lib/yabridge/yabridgectl" "/usr/bin"
          sudo ln -s "$STOWDIR/$name/usr/lib/yabridge/yabridge-host.exe" "/usr/bin"
          sudo ln -s "$STOWDIR/$name/usr/lib/yabridge/yabridge-host.exe.so" "/usr/bin"
          sudo ln -s "$STOWDIR/$name/usr/lib/yabridge/yabridge-host-32.exe" "/usr/bin"
          sudo ln -s "$STOWDIR/$name/usr/lib/yabridge/yabridge-host-32.exe.so" "/usr/bin"
}

postinst(){
          yabridgectl set --path=/usr/lib/yabridge
}
