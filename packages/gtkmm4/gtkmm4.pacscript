if [[ "$(grep -Po 'ID=\K[^"]+' /etc/os-release)" == "debian" ]]; then
    fancy_message error "This script doesn't work on Debian"
    cleanup # Trigger pacstall cleanups
    exit 1
fi

name="gtkmm4"
version="4.7.1"
description="A C++ interface for GTK4 library"
repology=("project: gtkmm" "visiblename: gtkmm4.0")
url="https://gitlab.gnome.org/GNOME/gtkmm/-/archive/${version}/gtkmm-${version}.tar.gz"
hash="89de1024cb6d3f764b4fdca4ebe11791958aa6a8a2f46d7da1da166ccbb61841"
maintainer="Marie Piontek <marie@kaifa.ch>"
gives="${name}"
breaks="${name} ${name}-bin ${name}-deb ${name}-app ${name}-git"

depends="libgtk-4-1 mm-common libpangomm-1.4-1v5 libpangomm-1.4-dev libxkbcommon-dev"
build_depends="git meson ninja-build"

prepare() {
    meson --prefix="/usr" builddir
    cd builddir
}

build() {
    ninja
}

install() {
    sudo DESTDIR="$STOWDIR/$name" ninja install
}
