name="pipewire"
pkgname="pipewire"
version="0.3.29"
build_depends="meson libdbus-1-dev"
url="https://gitlab.freedesktop.org/$name/$name/-/archive/$version/$name-$version.zip"
maintainer="Henryws <hwengerstickel@pm.me>"
description="PipeWire is a server and user space API to deal with multimedia pipelines"
hash="ee39d3b6643995c30bb94187119590cfafa79b597ebffe216b9f7d6f5d0885b4"
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
