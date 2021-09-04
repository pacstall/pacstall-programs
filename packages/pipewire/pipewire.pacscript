name="pipewire"
version="0.3.34"
build_depends="meson libdbus-1-dev"
url="https://gitlab.freedesktop.org/$name/$name/-/archive/$version/$name-$version.zip"
maintainer="Henryws <hwengerstickel@pm.me>"
description="PipeWire is a server and user space API to deal with multimedia pipelines."
hash="0603ffcf84b971f4b49aa5c6e2072ea44d0487d9fbea4e19dbfb52fce193afc1"
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
