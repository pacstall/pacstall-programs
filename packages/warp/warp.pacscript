name="warp"
gives="warp"
version="0.5.4"
description="Fast and secure file transfer"
repology=("project: warp-share-files")
build_depends=("meson" "ninja-build" "libgtk-4-dev" "libadwaita-1-dev" "libappstream-glib-dev" "gir1.2-appstreamglib-1.0" "libappstream-glib8" "libadwaita-1-0" "gettext" "desktop-file-utils" "rustc" "cargo" "itstool" "cmake")
depends=("libgtk-4-dev" "gir1.2-appstreamglib-1.0" "libappstream-glib8" "libadwaita-1-0" "gettext" "desktop-file-utils" "rustc" "cargo")
url="https://gitlab.gnome.org/World/${name}/-/archive/v${version}/${name}-v${version}.tar.gz"
hash="e90e4b3329961277aa228e6c0b4ceed640e97f848d520607f8f651212516e4d3"
maintainer="Oren Klopfer <oren@taumoda.com>"

build() {
  sudo meson setup build
}

install() {
  sudo DESTDIR="${pkgdir}" ninja -C build install
}
