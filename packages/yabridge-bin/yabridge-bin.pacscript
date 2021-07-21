name="yabridge-bin"
version="3.4.0"
url="https://github.com/robbert-vdh/yabridge/releases/download/$version/yabridge-$version.tar.gz"
build_depends="libxcb1 libxcb1:i386"
breaks="yabridge-lts-bin"
description="A modern and transparent way to use Windows VST2 and VST3 plugins on Linux."
hash="9305916c90001339180ab9751513e1210053c014da469ad2850c87b03ccd7539"
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
