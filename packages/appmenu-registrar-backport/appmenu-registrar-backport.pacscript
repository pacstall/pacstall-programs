pkgname="appmenu-registrar-backport"
gives="appmenu-registrar"
pkgver="24.02"
pkgrel="2"
pkgdesc="Small utility to hold DBusMenu menus"
makedepends=('meson' 'libglib2.0-0' 'libglib2.0-dev')
depends=('libglib2.0-0')
arch=('amd64' 'arm64')
license=('LGPL-3.0-or-later')
url='https://gitlab.com/vala-panel-project/vala-panel-appmenu'
source=("${url}/-/archive/${pkgver}/vala-panel-appmenu-${pkgver}.tar.gz")
maintainer=("Oren Klopfer <oren@taumoda.com>")
compatible=("debian:trixie" "debian:sid" "ubuntu:oracular" "ubuntu:devel" "ubuntu:plucky" "ubuntu:questing")
build() {
  meson build "vala-panel-appmenu-${pkgver}/subprojects/registrar" --prefix=/usr --libexecdir=lib
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build --no-rebuild
}
