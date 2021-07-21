name="yabridge-lts-bin"
version="3.4.0"
url="https://github.com/robbert-vdh/yabridge/releases/download/$version/yabridge-$version-ubuntu-18.04.tar.gz"
build_depends="libxcb1 libxcb1:i386"
breaks="yabridge-bin"
description="A modern and transparent way to use Windows VST2 and VST3 plugins on Linux."
hash="0cb503e9281f40c7024713a5b8b12b90966fb91745dbae50dc76f77a673e7bb1"
removescript="no"
optdepends=("wine: 32-bit windows emulator"
"wine64: 64-bit windows emulator")
maintainer="rain1598 <guacamolek@yandex.com>"
prepare() {
          mv ./* /usr/lib
          cd /usr/lib
}

build() {
          echo "0" > /dev/null
}

install() {
          ln -s /usr/lib/yabridgectl /usr/bin/yabridgectl
          ln -s /usr/lib/yabridge-host.exe /usr/bin/yabridge-host.exe
}

postinst(){
          echo "0" > /dev/null
}
