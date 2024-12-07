pkgname="spot-client-git"
gives="spot-client"
pkgdesc="Gtk/Rust native Spotify (premium only) client"
source=("https://github.com/xou816/spot.git")
pkgver="0.4.0"
repology=("project: ${gives}")
incompatible=("ubuntu:bionic" "ubuntu:focal" "ubuntu:jammy" "ubuntu:kinetic" "debian:stretch" "debian:buster" "debian:bullseye" "debian:sid")
maintainer=("Oren Klopfer <oren@taumoda.com>")
depends=("libgtk-4-dev" "libadwaita-1-dev" "libpulse-dev" "libasound2-dev" "libssl-dev" "openssl")
makedepends=("libgtk-4-dev" "libadwaita-1-dev" "libpulse-dev" "libasound2-dev" "rustc" "cargo" "meson" "ninja-build" "cmake" "openssl" "libssl-dev")
external_connection=true
arch=('amd64')

build() {
  cd "spot"
  meson target -Doffline=false --prefix="${pkgdir}/usr"
}

package() {
  cd "spot"
  DESTDIR="${pkgdir}" ninja install -C target
}
