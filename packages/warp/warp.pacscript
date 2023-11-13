name="warp"
gives="warp"
pkgver="0.6.1"
pkgdesc="Fast and secure file transfer"
repology=("project: warp-share-files")
makedepends=("meson" "ninja-build" "libgtk-4-dev" "libadwaita-1-dev" "libappstream-glib-dev" "gir1.2-appstreamglib-1.0" "libappstream-glib8" "libadwaita-1-0" "gettext" "desktop-file-utils" "rustc" "cargo" "itstool" "cmake")
depends=("libgtk-4-dev" "gir1.2-appstreamglib-1.0" "libappstream-glib8" "libadwaita-1-0" "gettext" "desktop-file-utils" "rustc" "cargo")
url="https://gitlab.gnome.org/World/${name}/-/archive/v${pkgver}/${name}-v${pkgver}.tar.gz"
hash="94fc9bb37d7ac034633ec83039a48b29b50df310c4711b6dba95d51a07b3d5c8"
maintainer="Oren Klopfer <oren@taumoda.com>"
incompatible=("ubuntu:20.04" "ubuntu:20.10" "ubuntu:21.04" "ubuntu:21.10" "ubuntu:22.04" "debian:*")

build() {
  sudo meson setup build
}

package() {
  sudo DESTDIR="${pkgdir}" ninja -C build install
}
