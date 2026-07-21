pkgname="hyprpicker"
repology=("project: ${pkgname}")
pkgver="0.4.7"
source=("@${pkgname}~${pkgver}::https://github.com/hyprwm/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("cde02b92abe372187c9d59a7cb2ca07ede5c3e1a8c81ed8b209dc0d3ac5f0339")
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
