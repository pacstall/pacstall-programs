name="tuner"
version="1.3.1"
license="GPL-3.0"
url="https://github.com/louis77/tuner/archive/refs/tags/1.3.1.zip"
build_depends="meson valac libgtk-3-dev libgranite-dev libsoup2.4-dev libgstreamer1.0-dev libgstreamer-plugins-bad1.0-dev libjson-glib-dev libgee-0.8-dev libgeocode-glib-dev libgeoclue-2-dev"
breaks="tuner-git"
depends=""
description="Discover and listen to internet radio stations."
hash="4b8cc5941652ebb872793bbc0f3d56e1c5d4423e6cf8d16aaeea25999075c1aa"
removescript="yes"

prepare() {
    meson builddir --prefix=/usr
}

build() {
    ninja -C builddir -j$(nproc)
}

install() {
    sudo DESTDIR=/usr/src/pacstall/tuner ninja -C builddir install
}

postinst() {
        glib-compile-schemas /usr/share/glib-2.0/schemas
        update-desktop-database -q /usr/share/applications
        gtk-update-icon-cache -qtf  /usr/share/icons/hicolor
}

removescript() {
        update-desktop-database -q /usr/share/applications
}
