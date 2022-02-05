name="pipewire"
version="0.3.44"
build_depends="meson libdbus-1-dev debhelper-compat findutils libasound2-dev libavcodec-dev libavfilter-dev libavformat-dev libdbus-1-dev libglib2.0-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libsbc-dev libsdl2-dev libudev-dev libva-dev libv4l-dev libx11-dev ninja-build pkg-config python3-docutils python3-pip"
url="https://gitlab.freedesktop.org/"${name}/"${name}"/-/archive/"${version}"/"${name}-${version}.zip"
maintainer="Henryws <hwengerstickel@pm.me>"
description="PipeWire is a server and user space API to deal with multimedia pipelines."
hash="3ddb9a246fa7c048284851081e08d1b106df491e3b1fcd2bdc9d76460c245f04"
prepare() {
    meson setup builddir
}

build() {
    meson configure builddir -Dprefix=/usr
    ninja -C builddir
}

install() {
    cd builddir/ || return 1
    sudo DESTDIR=/usr/src/pacstall/pipewire meson install
}
