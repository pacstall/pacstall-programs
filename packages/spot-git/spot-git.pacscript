name="spot-client-git"
gives="spot-client"
description="Gtk/Rust native Spotify (premium only) client"
url="https://github.com/xou816/spot"
repology="project: spot-client"
depends="libgtk-4-dev libadwaita-1-dev libpulse-dev libasound2-dev"
build_depends="libgtk-4-dev libadwaita-1-dev libpulse-dev libasound2-dev rustc cargo meson ninja-build cmake"
pkgver() {
    git ls-remote "${url}" master | cut -f1 | cut -c1-8
}
version="$(pkgver)"

build() {
    sudo meson target -Dbuildtype=debug -Doffline=false --prefix="${pkgdir}/usr"
}

install() {
    sudo DESTDIR="${pkgdir}" ninja install -C target
}
