name="spot-client-git"
gives="spot-client"
description="Gtk/Rust native Spotify (premium only) client"
url="https://github.com/xou816/spot.git"
repology=("project: ${gives}")
incompatible=("ubuntu:bionic" "ubuntu:focal" "ubuntu:jammy" "ubuntu:kinetic" "debian:stretch" "debian:buster" "debian:bullseye" "debian:sid")
maintainer="Oren Klopfer <oren@taumoda.com>"
depends=("libgtk-4-dev" "libadwaita-1-dev" "libpulse-dev" "libasound2-dev" "libssl-dev" "openssl")
build_depends=("libgtk-4-dev" "libadwaita-1-dev" "libpulse-dev" "libasound2-dev" "rustc" "cargo" "meson" "ninja-build" "cmake" "openssl" "libssl-dev")
arch=('amd64')
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}
version="$(pkgver)"

build() {
  sudo meson target -Doffline=false --prefix="${pkgdir}/usr"
}

install() {
  sudo DESTDIR="${pkgdir}" ninja install -C target
}
