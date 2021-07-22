name="yabridge-bin"
version="3.4.0"
url="https://github.com/robbert-vdh/yabridge/releases/download/$version/yabridge-$version.tar.gz"
build_depends="libxcb1 libxcb1:i386"
breaks="yabridge-lts-bin"
description="A modern and transparent way to use Windows VST2 and VST3 plugins on Linux."
hash="9305916c90001339180ab9751513e1210053c014da469ad2850c87b03ccd7539"
optdepends=("wine: 32-bit windows emulator"
"wine64: 64-bit windows emulator")
maintainer="rain1598 <guacamolek@yandex.com>"
prepare() {
          sudo install -D ./* /usr/lib
}

build() {
          true
}

install() {
          sudo install -D ./yabridgectl /usr/src/pacstall/$name/usr/bin/
          sudo install -D ./yabridge-host.exe /usr/src/pacstall/$name/usr/bin/
}

postinst(){
          true
}
