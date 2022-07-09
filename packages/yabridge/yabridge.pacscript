name="yabridge"
version="4.0.2"
url="https://github.com/robbert-vdh/yabridge/releases/download/${version}/yabridge-${version}.tar.gz"
build_depends="libxcb1 libxcb1:i386"
description="A modern and transparent way to use Windows VST2 and VST3 plugins on Linux."
hash="e9b66d48339cec5f3cc929d1da37d73c78c04d98281d051a2cbbe20dfb8f9eba"
optdepends=("wine: 32-bit windows emulator"
  "wine64: 64-bit windows emulator")
maintainer="echometerain <echometer@disroot.org>"
prepare() {
  sudo install -D ./* -t "${STOWDIR}/${name}/usr/lib/yabridge"
}
repology=("project: yabridge")

build() {
  true
}

install() {
  sudo ln -sf "${STOWDIR}/${name}/usr/lib/yabridge/yabridgectl" "/usr/bin"
  sudo ln -sf "${STOWDIR}/${name}/usr/lib/yabridge/yabridge-host.exe" "/usr/bin"
  sudo ln -sf "${STOWDIR}/${name}/usr/lib/yabridge/yabridge-host.exe.so" "/usr/bin"
  sudo ln -sf "${STOWDIR}/${name}/usr/lib/yabridge/yabridge-host-32.exe" "/usr/bin"
  sudo ln -sf "${STOWDIR}/${name}/usr/lib/yabridge/yabridge-host-32.exe.so" "/usr/bin"
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
