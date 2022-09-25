if [[ "$(grep -Po 'ID=\K[^"]+' /etc/os-release)" == "debian" ]]; then
    fancy_message error "This script doesn't work on Debian"
    cleanup # Trigger pacstall cleanups
    exit 1
fi

name="gtkmm4"
version="4.8.0"
description="A C++ interface for GTK4 library"
repology=("project: gtkmm")
url="https://gitlab.gnome.org/GNOME/gtkmm/-/archive/${version}/gtkmm-${version}.tar.gz"
hash="40a9cdb260564ef539bcbc6b736852e44ece0ae96f7c2552097bec2d6e059c6a"
maintainer="Marie Piontek <marie@kaifa.ch>"
gives="${name}"
breaks="${name} ${name}-bin ${name}-deb ${name}-app ${name}-git"

depends="libgtk-4-1 mm-common libpangomm-1.4-1v5 libpangomm-1.4-dev libxkbcommon-dev libxml2-dev libxml2 wayland-scanner++ waylandpp-dev libwayland-dev libxrandr-dev libx11-dev libxi-dev libxi6 libxcursor-dev libxcursor1 libxdamage-dev libxdamage1 libxrender-dev libxrender1 libxinerama-dev libxinerama1 libxext-dev libxext6 libxfixes-dev libxfixes3 libgstreamer-plugins-bad1.0-dev libglib2.0-dev libjpeg-turbo8 libjpeg-turbo8-dev libpng-dev libpng16-16 librsvg2-2 librsvg2-dev libgdk-pixbuf2.0-0 libgdk-pixbuf2.0-bin"
build_depends="git meson ninja-build libxml-parser-perl libxml-xpath-perl"

prepare() {
    sed -i "/revision=master/c\revision=glibmm-2-72" subprojects/glibmm-2.68.wrap
    meson --prefix="${STOWDIR}/${name}/usr" -Dmaintainer-mode=true builddir
    meson configure builddir/ -Dmaintainer-mode=true
    cd builddir
}

build() {
    ninja
}

install() {
    sudo DESTDIR="${STOWDIR}/${name}" ninja install
}
