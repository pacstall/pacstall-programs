name="yabridge"
version="3.7.0"
url="https://github.com/robbert-vdh/yabridge/releases/download/$version/yabridge-$version.tar.gz"
build_depends="libxcb1 libxcb1:i386"
description="A modern and transparent way to use Windows VST2 and VST3 plugins on Linux."
hash="8038bcef74b8cd4d0b05b7318eac74fa241abc5db0b7f92e29ab8d7425c5c8ff"
optdepends=("wine: 32-bit windows emulator"
"wine64: 64-bit windows emulator")
maintainer="echometerain <echometer@disroot.org>"
removescript=yes
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
removescript(){
          sudo rm "/usr/bin/yabridgectl"
          sudo rm "/usr/bin/yabridge-host.exe"
          sudo rm "/usr/bin/yabridge-host.exe.so"
          sudo rm "/usr/bin/yabridge-host-32.exe"
          sudo rm "/usr/bin/yabridge-host-32.exe.so"
}
