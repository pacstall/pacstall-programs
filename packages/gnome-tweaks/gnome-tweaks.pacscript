name="gnome-tweaks"
pkgname="gnome-tweaks"
url="https://github.com/GNOME/gnome-tweaks/archive/refs/tags/40.0.zip"
version="40.0"
license="GPL-3.0"
build_depends="meson"
depends="gsettings-desktop-schemas python3 gnome-settings-daemon gnome-shell-common mutter-common python3-gi gir1.2-gtk-3.0 gir1.2-gnomedesktop-3.0 gir1.2-handy-0.0 gir1.2-soup-2.4 gir1.2-notify-0.7 gir1.2-glib-2.0 gir1.2-pango-1.0 gnome-shell-extension-prefs"
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
          sudo porg -lp gnome-tweaks "sudo ninja -C builddir install"
}
