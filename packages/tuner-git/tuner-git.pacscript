name="tuner-git"
license="GPL-3.0"
url="https://github.com/louis77/tuner.git"
build_depends="meson valac libgtk-3-dev libgranite-dev libsoup2.4-dev libgstreamer1.0-dev libgstreamer-plugins-bad1.0-dev libjson-glib-dev libgee-0.8-dev libgeocode-glib-dev libgeoclue-2-dev"
depends=""
breaks="tuner"
description="Tuner Radio Player - development version"
removescript="yes"
pkgver() {
    git ls-remote "${url}" master | cut -f1
}
version="$(pkgver)"

prepare() {
    if ask "Are you sure you want to install the development version of Tuner?" Y; then
        meson builddir --prefix=/usr
    else
        exit 1
    fi
}

build() {
    ninja -C builddir -j$(nproc)
}

install() {
    sudo DESTDIR=/usr/src/pacstall/$name ninja -C builddir install
}

postinst() {
        glib-compile-schemas /usr/share/glib-2.0/schemas
        update-desktop-database -q /usr/share/applications
        gtk-update-icon-cache -qtf  /usr/share/icons/hicolor
}

removescript() {
        update-desktop-database -q /usr/share/applications
}
