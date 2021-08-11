name="pipewire"
version="0.3.33"
build_depends="meson libdbus-1-dev"
url="https://gitlab.freedesktop.org/$name/$name/-/archive/$version/$name-$version.zip"
maintainer="Henryws <hwengerstickel@pm.me>"
description="PipeWire is a server and user space API to deal with multimedia pipelines"
hash="4c07a4af96058c63bb491222dd47ec73ae85a00a415ddf1c19477253818cd17e"
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
