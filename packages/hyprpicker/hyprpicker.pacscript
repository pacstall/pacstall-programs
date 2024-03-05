name="hyprpicker"
repology=("project: ${name}")
pkgver="0.2.0"
source=("https://github.com/hyprwm/${name}/archive/refs/tags/v${pkgver}.tar.gz")
hash=("fa1b0c29682f5ede5a03d754770d152f38d869bc1faa300564680cef2de0758a")
arch=('amd64' 'arm64')
compatible=('ubuntu:devel' 'debian:sid' 'ubuntu:mantic' 'ubuntu:noble')
makedepends=('cmake' 'meson' 'ninja-build' 'wayland-utils' 'wayland-protocols' 'libwayland-dev' 'libwlroots-dev' 'libmagic-dev' 'libpango1.0-dev' 'libjpeg-dev')
homepage='https://hyprland.org/'
pkgdesc="wlroots-compatible Wayland color picker"
maintainer="Oren Klopfer <oren@taumoda.com>"

build() {
  make all -j"${NCPU}"
}

package() {
  sudo install -Dm755 ./build/"${name}" -t "${pkgdir}/usr/bin"
}
