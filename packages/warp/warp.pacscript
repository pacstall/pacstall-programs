pkgname="warp"
gives="warp"
pkgver="0.6.2"
pkgdesc="Fast and secure file transfer"
repology=("project: warp-share-files")
makedepends=("meson" "ninja-build" "libgtk-4-dev" "libadwaita-1-dev" "libappstream-glib-dev" "gir1.2-appstreamglib-1.0" "libappstream-glib8" "libadwaita-1-0" "gettext" "desktop-file-utils" "rustc" "cargo" "itstool" "cmake")
depends=("libgtk-4-dev" "gir1.2-appstreamglib-1.0" "libappstream-glib8" "libadwaita-1-0" "gettext" "desktop-file-utils" "rustc" "cargo")
source=("https://gitlab.gnome.org/World/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=("b3df2017e19c7bf1477b5bd07d857d0d8fe5375ab293d932a8a4e30aba91496a")
maintainer=("Oren Klopfer <oren@taumoda.com>")
incompatible=("ubuntu:20.04" "ubuntu:20.10" "ubuntu:21.04" "ubuntu:21.10" "ubuntu:22.04" "debian:*")

build() {
  cd "${_archive}"
  meson setup build
}

package() {
  cd "${_archive}"
  DESTDIR="${pkgdir}" ninja -C build install
}
