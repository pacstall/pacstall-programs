name="pipewire"
pkgname="pipewire"
version="0.3.29"
build_depends="meson libdbus-1-dev"
url="https://gitlab.freedesktop.org/$name/$name/-/archive/$version/$name-$version.zip"
maintainer="Henryws <hwengerstickel@pm.me>"
description="PipeWire is a server and user space API to deal with multimedia pipelines"
hash="d942c4be201ae6da4ba513c6b6c98e4d3dff433241acd020f567aa4e4de8982f"
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
