pkgname="hyprpaper"
repology=("project: ${pkgname}")
pkgver="0.4.0"
source=("@${pkgname}~${pkgver}::https://github.com/hyprwm/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("cabd8181aa64dead3a0ed6e801e391c54b07f3400eecb9dcf2a01ac5d1cf47d3")
arch=('amd64' 'arm64')
compatible=('ubuntu:devel' 'debian:sid' 'ubuntu:mantic' 'ubuntu:noble')
makedepends=('cmake' 'meson' 'ninja-build' 'wayland-utils' 'wayland-protocols' 'libwayland-dev' 'libwlroots-dev' 'libmagic-dev' 'libpango1.0-dev' 'libjpeg-dev')
url='https://hyprland.org/'
pkgdesc="Wayland wallpaper utility with IPC controls"
maintainer=("Elsie19 <elsie19@pm.me>")

build() {
  cd "${pkgname}~${pkgver}"
  make all -j"${NCPU}"
}

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 ./build/"${pkgname}" -t "${pkgdir}/usr/bin"
}
