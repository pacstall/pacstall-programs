name="pipewire"
version="0.3.59"
build_depends="meson libdbus-1-dev debhelper-compat findutils libasound2-dev libavcodec-dev libavfilter-dev libavformat-dev libdbus-1-dev libglib2.0-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libsbc-dev libsdl2-dev libudev-dev libva-dev libv4l-dev libx11-dev ninja-build pkg-config python3-docutils python3-pip"
url="https://gitlab.freedesktop.org/${name}/${name}/-/archive/${version}/${name}-${version}.zip"
maintainer="Henryws <hwengerstickel@pm.me>"
description="Server and user space API to deal with multimedia pipelines"
hash="129a73ea4eb8922c087d02663cd6590dcee9bd1aa67ce3e83f0a3da3375174c7"
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
    # Move /lib files to /usr/lib, because stow complains about /lib being a symlink
    sudo mkdir -p /usr/src/pacstall/pipewire/usr/lib/udev/rules.d/
    sudo mv /usr/src/pacstall/pipewire/lib/udev/rules.d/90-pipewire-alsa.rules /usr/src/pacstall/pipewire/usr/lib/udev/rules.d/
    sudo rm -r /usr/src/pacstall/pipewire/lib
}
