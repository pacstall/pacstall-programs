pkgname="hyprpicker"
repology=("project: ${pkgname}")
pkgver="0.2.0"
source=("@${pkgname}~${pkgver}::https://github.com/hyprwm/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("fa1b0c29682f5ede5a03d754770d152f38d869bc1faa300564680cef2de0758a")
arch=('amd64' 'arm64')
compatible=('ubuntu:devel' 'debian:sid' 'ubuntu:mantic' 'ubuntu:noble')
makedepends=('cmake' 'meson' 'ninja-build' 'wayland-utils' 'wayland-protocols' 'libwayland-dev' 'libwlroots-dev' 'libmagic-dev' 'libpango1.0-dev' 'libjpeg-dev')
url='https://hyprland.org/'
pkgdesc="wlroots-compatible Wayland color picker"
maintainer=("Oren Klopfer <oren@taumoda.com>")

build() {
  cd "${pkgname}~${pkgver}"
  make all -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 ./build/"${pkgname}" -t "${pkgdir}/usr/bin"
}
