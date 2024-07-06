pkgname="mangohud"
repology=("project: mangohud")
pkgver="0.7.2"
source=("https://github.com/flightlessmango/MangoHud/archive/refs/tags/v${pkgver}.tar.gz")
url='https://github.com/flightlessmango/MangoHud'
makedepends=("gcc" "g++" "gcc-multilib" "g++-multilib" "meson" "ninja-build" "python3-pip" "python3-setuptools" "python3-wheel" "python3-mako" "pkg-config" "mesa-common-dev" "libx11-dev" "libxnvctrl-dev" "libdbus-1-dev" "glslang-tools" "libwayland-dev" "libxkbcommon-dev")
pkgdesc="A Vulkan and OpenGL overlay for monitoring FPS, temperatures, CPU/GPU load and more"
sha256sums=("67d2425c0cc634574d8bd8a924e0e1a2e909b47ed9b8c02029b5baffe46657fc")
incompatible=('debian:bullseye')
maintainer=("xdavius <xdavius@github.com>")
external_connection=true

build() {
  cd "${_archive}"
  meson build --prefix="/usr"
}

package() {
  cd "${_archive}"
  DESTDIR="${pkgdir}" ninja -j"${NCPU}" -C build install
}
