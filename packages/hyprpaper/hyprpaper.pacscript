pkgname="hyprpaper"
repology=("project: ${pkgname}")
pkgver="0.8.4"
source=("@${pkgname}~${pkgver}::https://github.com/hyprwm/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("4912c7aede303918f38a3fc6b294429e2d541b639ebba67bcab58d1d367ea360")
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
