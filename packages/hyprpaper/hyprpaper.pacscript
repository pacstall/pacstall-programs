name="hyprpaper"
repology=("project: ${name}")
pkgver="0.4.0"
url="https://github.com/hyprwm/${name}/archive/refs/tags/v${pkgver}.tar.gz"
hash="cabd8181aa64dead3a0ed6e801e391c54b07f3400eecb9dcf2a01ac5d1cf47d3"
arch=('amd64' 'arm64')
compatible=('ubuntu:devel' 'debian:sid' 'ubuntu:mantic' 'ubuntu:noble')
makedepends=('cmake' 'wayland-utils' 'wayland-protocols' 'libmagic-dev' 'libpango1.0-dev' 'libjpeg-turbo8-dev')
homepage='https://hyprland.org/'
pkgdesc="Wayland wallpaper utility with IPC controls"
maintainer="Elsie19 <elsie19@pm.me>"

build() {
  sudo make all -j"${NCPU}"
}

package() {
  sudo install -Dm755 ./build/"${name}" -t "${pkgdir}/usr/bin"
}
