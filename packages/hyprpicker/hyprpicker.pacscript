pkgname="hyprpicker"
repology=("project: ${pkgname}")
pkgver="0.4.1"
source=("https://github.com/hyprwm/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("e14d881f9645fd633b29370875ec4e98e24ad3455c522f7bcd68c3d17eda338a")
arch=('amd64' 'arm64')
compatible=('ubuntu:devel' 'debian:sid' 'ubuntu:mantic' 'ubuntu:noble')
makedepends=('cmake' 'meson' 'ninja-build' 'wayland-utils' 'wayland-protocols' 'libwayland-dev' 'libwlroots-dev' 'libmagic-dev' 'libpango1.0-dev' 'libjpeg-dev')
url='https://hyprland.org/'
pkgdesc="wlroots-compatible Wayland color picker"
maintainer=("Oren Klopfer <oren@taumoda.com>")

build() {
  cd "${_archive}"
  make all -j"${NCPU}"
}

package() {
  cd "${_archive}"
  install -Dm755 ./build/"${pkgname}" -t "${pkgdir}/usr/bin"
}
