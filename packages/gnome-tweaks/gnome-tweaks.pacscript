name="gnome-tweaks"
pkgname="gnome-tweaks"
url="https://github.com/GNOME/gnome-tweaks/archive/refs/tags/${version}.zip"
version="40.10"
license="GPL-3.0"
build_depends="meson"
depends="gsettings-desktop-schemas python3 gnome-settings-daemon gnome-shell-common mutter-common python3-gi gir1.2-gtk-3.0 gir1.2-gnomedesktop-3.0 libhandy-1-0 gir1.2-soup-2.4 gir1.2-notify-0.7 gir1.2-glib-2.0 gir1.2-pango-1.0 gnome-shell-extension-prefs"
gives="gnome-tweaks"
breaks="${gives} ${gives}-bin ${gives}-git"
description="Graphical interface for advanced GNOME 3 settings"
hash="36c5fce161f5d8df4b206427b838398a9f4cfa88cc66098e374e92fbd7d665cd"
repology=("project: gnome-tweaks")

prepare() {
          meson builddir
}

build() {
        ninja -C builddir
}

install() {
          sudo DESTDIR=/usr/src/pacstall/gnome-tweaks ninja -C builddir install -j$(nproc)
}
