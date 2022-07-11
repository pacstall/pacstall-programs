name="dmenu"
version="5.0"
url="https://dl.suckless.org/tools/${name}-${version}.tar.gz"
build_depends="libxinerama-dev libxft-dev"
breaks="${name} ${name}_run ${name}_path"
repology=("project: ${name}")
description="A generic menu for X"
hash="fe18e142c4dbcf71ba5757dbbdea93b1c67d58fc206fc116664f4336deef6ed3"

prepare() {
        true
}

build() {
        make -j"$(nproc)"
}

install() {
        sudo make install DESTDIR="{STOWDIR}/{name}"
}
