pkgname="warp"
gives="warp"
arch=("any")
pkgver="0.9.2"
pkgdesc="Fast and secure file transfer"
repology=("project: warp-share-files")
makedepends=("meson" "ninja-build" "libgtk-4-dev" "libadwaita-1-dev" "libappstream-glib-dev" "gir1.2-appstreamglib-1.0" "libappstream-glib8" "libadwaita-1-0" "gettext" "desktop-file-utils" "rustc" "cargo" "itstool" "cmake")
depends=("libgtk-4-dev" "gir1.2-appstreamglib-1.0" "libappstream-glib8" "libadwaita-1-0" "gettext" "desktop-file-utils" "rustc" "cargo")
source=("@${pkgname}~${pkgver}::https://gitlab.gnome.org/World/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=("0eb3ff44e0b4dbb7969841e22f9e5b4dd516f284c6f28eaa4d9753dc64b37f22")
external_connection=true
maintainer=("Oren Klopfer <oren@taumoda.com>")
incompatible=("ubuntu:20.04" "ubuntu:20.10" "ubuntu:21.04" "ubuntu:21.10" "ubuntu:22.04" "debian:*")

build() {
  cd "${pkgname}~${pkgver}"
  meson setup build
}

package() {
  cd "${pkgname}~${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
}
