name="pipewire"
version="0.3.38"
build_depends="meson libdbus-1-dev"
url="https://gitlab.freedesktop.org/$name/$name/-/archive/$version/$name-$version.zip"
maintainer="Henryws <hwengerstickel@pm.me>"
description="PipeWire is a server and user space API to deal with multimedia pipelines."
hash="998800392d6b235ef1ab9e7490e3001b995b4a6a7951f8b7e3f0eb8a91b35c08"
prepare() {
    meson setup builddir
}

build() {
    meson configure builddir -Dprefix=/usr
    ninja -C builddir
}

install() {
    cd builddir/
    sudo DESTDIR=/usr/src/pacstall/pipewire meson install
}
