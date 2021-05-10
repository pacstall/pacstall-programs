name="dmenu-distrotube"
pkgname="dmenu"
version="1.4"
url="https://gitlab.com/dwt1/dmenu-distrotube.git"
depends="libxinerama-dev libxft-dev"
gives="dmenu"
description="Distrotube's dmenu build"
breaks="dmenu dmenu_run dmenu_path"

prepare() {
          true
}

build() {
        make -j$(nproc)
}

install() {
        sudo make install DESTDIR=/usr/src/pacstall/dmenu
}

