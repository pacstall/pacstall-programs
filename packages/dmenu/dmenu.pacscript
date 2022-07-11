name="dmenu"
version="5.1"
url="https://dl.suckless.org/tools/${name}-${version}.tar.gz"
build_depends="libxinerama-dev libxft-dev"
breaks="${name} ${name}_run ${name}_path"
repology=("project: ${name}")
description="A generic menu for X"
hash="1f4d709ebba37eb7326eba0e665e0f13be4fa24ee35c95b0d79c30f14a348fd5"

prepare() {
        true
}

build() {
        make -j"$(nproc)"
}

install() {
        sudo make install DESTDIR="{STOWDIR}/{name}"
}
