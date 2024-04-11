pkgname="mangohud"
repology=("project: mangohud")
pkgver="0.7.1"
source=("https://github.com/flightlessmango/MangoHud/archive/refs/tags/v${pkgver}.tar.gz")
homepage='https://github.com/flightlessmango/MangoHud'
makedepends=("gcc" "g++" "gcc-multilib" "g++-multilib" "meson" "ninja-build" "python3-pip" "python3-setuptools" "python3-wheel" "python3-mako" "pkg-config" "mesa-common-dev" "libx11-dev" "libxnvctrl-dev" "libdbus-1-dev" "glslang-tools")
pkgdesc="A Vulkan and OpenGL overlay for monitoring FPS, temperatures, CPU/GPU load and more"
sha256sums=("40a4954f1f239ae7d2cec0fab3c7e965b30ded5e9729278f3cc0854676b954e5")
incompatible=('debian:bullseye')
maintainer=("Elsie19 <elsie19@pm.me>")

build() {
  cd "${_archive}"
  meson build --prefix="/usr"
}

package() {
  cd "${_archive}"
  DESTDIR="${pkgdir}" ninja -j"${NCPU}" -C build install
}
