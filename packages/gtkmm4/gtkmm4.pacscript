if [[ "$(grep -Po 'ID=\K[^"]+' /etc/os-release)" == "debian" ]]; then
    fancy_message error "This script doesn't work on Debian"
    cleanup # Trigger pacstall cleanups
    exit 1
fi

name="gtkmm4"
version="4.6.1"
description="A C++ interface for GTK4 library"
repology=("project: gtkmm")
url="https://gitlab.gnome.org/GNOME/gtkmm/-/archive/${version}/gtkmm-${version}.tar.gz"
hash="fcb4c1976dff727db879907a7d873d1581f7abc70987d2ea766b6f1c8216674d"
maintainer="Marie Piontek <marie@kaifa.ch>"
gives="${name}"
breaks="${name} ${name}-bin ${name}-deb ${name}-git"

depends="libgtk-4-1 mm-common libpangomm-1.4-1v5 libxml2 wayland-scanner++ libxi6 libxcursor1 libxdamage1 libxrender1 libxinerama1 libxext6 libxfixes3 libjpeg-turbo8 libpng16-16 librsvg2-2 libgdk-pixbuf2.0-0 libgdk-pixbuf2.0-bin libxml2-utils"
build_depends="git meson ninja-build libxml-parser-perl libxml-parser-perl libxml-xpath-perl librsvg2-dev libjpeg-turbo8-dev libpng-dev libgstreamer-plugins-bad1.0-dev libglib2.0-dev libxfixes-dev waylandpp-dev libwayland-dev libxrandr-dev libx11-dev libxi-dev libxext-dev libxinerama-dev libxrender-dev libxdamage-dev libxcursor-dev libpangomm-1.4-dev libxkbcommon-dev libxml2-dev"

prepare() {
    sed -i "/revision=master/c\revision=glibmm-2-72" subprojects/glibmm-2.68.wrap
    meson --prefix="/usr" -Dmaintainer-mode=true builddir
    meson configure builddir/ -Dmaintainer-mode=true
    cd builddir
}

build() {
    ninja
}

install() {
    sudo DESTDIR="${STOWDIR}/${name}" ninja install
}
