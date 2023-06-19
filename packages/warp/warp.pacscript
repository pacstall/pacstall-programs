name="warp"
gives="app.drey.Warp"
version="0.5.4"
description="Fast and secure file transfer"
repology=("project: warp-share-files")
url="https://gitlab.gnome.org/World/${name}/-/archive/v${version}/${name}-v${version}.tar.gz"
hash="e90e4b3329961277aa228e6c0b4ceed640e97f848d520607f8f651212516e4d3"
maintainer="Oren Klopfer <oren@taumoda.com>"

build() {
  sudo meson setup build
}

install() {
  sudo DESTDIR="${pkgdir}" ninja -C build install
}
