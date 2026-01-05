#!/usr/bin/env bash

pkgname="wlroots"
pkgver="0.19.2"
pkgdesc="Modular Wayland compositor library (git development version)"
url="https://gitlab.freedesktop.org/wlroots/wlroots"
license=("MIT")
arch=("amd64")

depends=(
  "libc6"
  "libdrm2"
  "libinput10"
  "libliftoff0"
  "libxcb1"
  "libglvnd0"
  "liblcms2-2"
  "libxkbcommon0"
  "libsystemd0"
  "libegl1"
  "libpixman-1-0"
  "libwayland-client0"
  "seatd"
  "libseat1"
  "glslang-tools"
  "libvulkan1"
  "libdisplay-info2"
)

makedepends=(
  "git"
  "bison"
  "meson"
  "cmake"
  "ninja-build"
  "pkg-config"
  "libvulkan-dev"
  "libwayland-dev"
  "wayland-protocols"
  "libliftoff-dev"
  "libdisplay-info-dev"
  "libexpat1-dev"
  "libxml2-dev"
)

conflicts=("${pkgname}")
provides=("${pkgname}")
source=("https://gitlab.freedesktop.org/wlroots/wlroots/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
maintainer=("aKqir24 <aKqir24@github.com>")
external_connection=true

prepare() {
  cd "${pkgname}-${pkgver}"
  meson setup build/ --buildtype=release --prefix=/usr -Dwerror=false --wrap-mode=forcefallback -Dexamples=false
}

build() {
  cd "${pkgname}-${pkgver}"
  ninja -C build/ -j"${NCPU}"
}

package() {
  cd "${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/wlroots/LICENSE"
}
