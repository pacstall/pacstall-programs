pkgname="mangohud"
repology=("project: mangohud")
pkgver="0.8.1"
source=("@${pkgname}~${pkgver}::https://github.com/flightlessmango/MangoHud/archive/refs/tags/v${pkgver}.tar.gz")
url='https://github.com/flightlessmango/MangoHud'
makedepends=(
  "gcc" "g++"
  "gcc-multilib" "g++-multilib"
  "meson" "ninja-build"
  "python3-pip" "python3-setuptools" "python3-wheel" "python3-mako"
  "pkg-config" "mesa-common-dev"
  "libx11-dev" "libxnvctrl-dev" "libdbus-1-dev" "glslang-tools"
  "libwayland-dev" "libxkbcommon-dev"
  "libx11-dev:i386" "libxnvctrl-dev:i386" "libdbus-1-dev:i386"
  "libwayland-dev:i386" "libxkbcommon-dev:i386" "libc6-dev-i386" "libgcc-12-dev:i386"
)
incompatible=('debian:bullseye')
provides=("mangohud:i386")
arch=("amd64")
pkgdesc="A Vulkan and OpenGL overlay for monitoring FPS, temperatures, CPU/GPU load and more"
sha256sums=("e07893cbdfa89602d97eaf12709330a93dee0f599f354fb177e810340b078471")
maintainer=("xdavius <xdavius@github.com>")
external_connection=true

build() {
  cd "${pkgname}~${pkgver}"

  # 32-bit games require 32-bit mangohud build

  # Build 64-bit version
  meson build64 --prefix="/usr"
  ninja -j"${NCPU}" -C build64

  # Set the necessary environment variables for 32-bit build
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib/i386-linux-gnu/pkgconfig:/usr/lib/pkgconfig"
  export LIBRARY_PATH="/usr/lib/i386-linux-gnu:/lib/i386-linux-gnu:/usr/lib/gcc/i686-linux-gnu/12"

  # Build 32-bit version
  meson build32 --libdir="lib/i386-linux-gnu" --prefix="/usr"
  ninja -j"${NCPU}" -C build32
}

package() {
  cd "${pkgname}~${pkgver}"

  # Install 64-bit version
  DESTDIR="${pkgdir}" ninja -j"${NCPU}" -C build64 install

  # Install 32-bit version
  DESTDIR="${pkgdir}" ninja -j"${NCPU}" -C build32 install
}
