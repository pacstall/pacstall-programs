name="mangohud"
repology=("project: mangohud")
pkgver="0.7.1"

homepage='https://github.com/flightlessmango/MangoHud'
url="${homepage}/archive/refs/tags/v${pkgver}.tar.gz"

makedepends=("gcc" "g++" "gcc-multilib" "g++-multilib" "meson" "ninja-build" "python3-pip" "python3-setuptools" "python3-wheel" "python3-mako" "pkg-config" "mesa-common-dev" "libx11-dev" "libxnvctrl-dev" "libdbus-1-dev" "glslang-tools")
pkgdesc="A Vulkan and OpenGL overlay for monitoring FPS, temperatures, CPU/GPU load and more"
hash="cfcc907c91b51f1fef4ec3f1cd52e2ff1b5caf207cdcff71869b94cefe39d208"
incompatible=('debian:bullseye')
maintainer="Elsie19 <elsie19@pm.me>"

build() {
  sudo meson build --prefix="/usr"
}

package() {
  sudo DESTDIR="${pkgdir}" ninja -j"${NCPU}" -C build install
}
