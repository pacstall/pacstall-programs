name="gnome-tweaks"
pkgname="gnome-tweaks"
url="https://github.com/GNOME/gnome-tweaks/archive/master.zip"
license="GPL-3.0"
build_depends="messon"
gives="gnome-tweaks"
breaks="thing"
description="Graphical interface for advanced GNOME 3 settings"

prepare() {
          meson builddir
}

build() {
        ninja -C builddir
}

install() {
          sudo porg -lp gnome-tweaks "ninja -C builddir install"
}
