name="yabridge"
version="3.8.1"
url="https://github.com/robbert-vdh/yabridge/releases/download/${version}/yabridge-${version}.tar.gz"
build_depends="libxcb1 libxcb1:i386"
description="A modern and transparent way to use Windows VST2 and VST3 plugins on Linux."
hash="3e19e8a4936f7611ca06b415a0fb0a9e336b38a3d3d99f33304aa48301e7ba84"
optdepends=("wine: 32-bit windows emulator"
  "wine64: 64-bit windows emulator")
maintainer="echometerain <echometer@disroot.org>"
prepare() {
  sudo install -D ./* -t "${STOWDIR}/${name}/usr/lib/yabridge"
}

build() {
  true
}

install() {
  sudo ln -s "${STOWDIR}/${name}/usr/lib/yabridge/yabridgectl" "/usr/bin"
  sudo ln -s "${STOWDIR}/${name}/usr/lib/yabridge/yabridge-host.exe" "/usr/bin"
  sudo ln -s "${STOWDIR}/${name}/usr/lib/yabridge/yabridge-host.exe.so" "/usr/bin"
  sudo ln -s "${STOWDIR}/${name}/usr/lib/yabridge/yabridge-host-32.exe" "/usr/bin"
  sudo ln -s "${STOWDIR}/${name}/usr/lib/yabridge/yabridge-host-32.exe.so" "/usr/bin"
}

postinst() {
  yabridgectl set --path="/usr/lib/yabridge"
}

removescript() {
  sudo rm "/usr/bin/yabridgectl"
  sudo rm "/usr/bin/yabridge-host.exe"
  sudo rm "/usr/bin/yabridge-host.exe.so"
  sudo rm "/usr/bin/yabridge-host-32.exe"
  sudo rm "/usr/bin/yabridge-host-32.exe.so"
}
