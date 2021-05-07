name="dmenu"
version="5.0"
url="https://dl.suckless.org/tools/dmenu-5.0.tar.gz"
build_depends="libxinerama libxft"
depends="sh"
breaks="dmenu dmenu_run dmenu_path"
description="A generic menu for X"
hash="fe18e142c4dbcf71ba5757dbbdea93b1c67d58fc206fc116664f4336deef6ed3"
prepare() {
}

build() {
        make -j$(nproc)
}

install() {
          sudo make install DESTDIR=/usr/src/pacstall
}
