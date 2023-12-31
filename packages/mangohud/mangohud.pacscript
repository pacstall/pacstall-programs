name="mangohud"
repology=("project: mangohud")
pkgver="0.7.0"
url="https://github.com/flightlessmango/MangoHud/releases/download/v${pkgver}/MangoHud-v${pkgver}-Source.tar.xz"
homepage='https://github.com/flightlessmango/MangoHud'
makedepends=("gcc" "g++" "gcc-multilib" "g++-multilib" "meson" "ninja-build" "python3-pip" "python3-setuptools" "python3-wheel" "python3-mako" "pkg-config" "mesa-common-dev" "libx11-dev" "libxnvctrl-dev" "libdbus-1-dev" "glslang-tools")
pkgdesc="A Vulkan and OpenGL overlay for monitoring FPS, temperatures, CPU/GPU load and more"
hash="05047cfdaf1668542e0c89bc999753ff8cea10b3d90f0a171788e5769a459832"
incompatible=('debian:bullseye')
maintainer="Elsie19 <elsie19@pm.me>"

build() {
  sudo meson build --prefix="/usr"
}

package() {
  sudo DESTDIR="${pkgdir}" ninja -j"${NCPU}" -C build install
}
