name="libtorrent-rasterbar"
gives="libtorrent"
repology=("project: ${name}")
version="2.0.6"
url="https://github.com/arvidn/${gives}/releases/download/v${version}/${name}-${version}.tar.gz"
build_depends="make"
breaks="${name}-git ${name}-dev ${name} ${gives} ${gives}-git"
description="An efficient feature complete C++ bittorrent implementation"
hash="438e29272ff41ccc68ec7530f1b98d639f6d01ec8bf680766336ae202a065722"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

prepare() {
    true
}

build() {
    ./configure
    make -j"$(nproc)"
}

install() {
    sudo make install DESTDIR="${STOWDIR}/${name}"
}
