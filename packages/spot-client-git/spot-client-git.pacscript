name="spot-client-git"
gives="spot-client"
description="Gtk/Rust native Spotify (premium only) client"
url="https://github.com/xou816/spot.git"
repology=("project: ${gives}")
incompatible=("ubuntu:bionic" "ubuntu:focal" "ubuntu:jammy" "ubuntu:kinetic" "debian:stretch" "debian:buster" "debian:bullseye" "debian:sid")
maintainer="oklopfer <oren@taumoda.com>"
depends=("libgtk-4-dev" "libadwaita-1-dev" "libpulse-dev" "libasound2-dev" "libssl-dev" "openssl")
build_depends=("libgtk-4-dev" "libadwaita-1-dev" "libpulse-dev" "libasound2-dev" "rustc" "cargo" "meson" "ninja-build" "cmake" "openssl" "libssl-dev")
arch=('amd64')
pkgver() {
  mkdir /tmp/count/ && cd /tmp/count && git clone -q --filter=tree:0 --depth=1 --no-checkout "${url}" -b master . && git log --format=%ct.%h && rm -r /tmp/count/
}
version="$(pkgver)"

build() {
  sudo meson target -Doffline=false --prefix="${pkgdir}/usr"
}

install() {
  sudo DESTDIR="${pkgdir}" ninja install -C target
}
