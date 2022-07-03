name="pipewire"
version="0.3.53"
build_depends="libdbus-1-dev debhelper-compat findutils libasound2-dev libavcodec-dev libavfilter-dev libavformat-dev libdbus-1-dev libglib2.0-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libsbc-dev libsdl2-dev libudev-dev libva-dev libv4l-dev libx11-dev ninja-build pkg-config python3-docutils python3-pip"
url="https://gitlab.freedesktop.org/${name}/${name}/-/archive/${version}/${name}-${version}.zip"
maintainer="Henryws <hwengerstickel@pm.me>"
description="PipeWire is a server and user space API to deal with multimedia pipelines."
hash="c6dd686dbbe4a24c1f3ed03b0a0fee2f5f8f85e466b068b4fb0cce01587a6d7e"
prepare() {
    if dpkg -l meson &>/dev/null; then
        ask "Your meson version is likely outdated, however pip contains a newer version that will compile pipewire correctly. Do you want to remove apt meson and install from pip" Y
        if [[ $answer -eq 1 ]]; then
            sudo apt purge meson
        else
            return 1
        fi
    fi
    sudo pip install meson
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
