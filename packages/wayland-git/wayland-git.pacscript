pkgname="wayland-git"
gives="wayland"
repology=("project: ${gives}")
arch=('amd64')
pkgver="1.24.0"
url='https://wayland.freedesktop.org'
source=("git+https://gitlab.freedesktop.org/wayland/wayland.git")
makedepends=(
  "pkg-config" "graphviz" "doxygen" "libffi-dev" "libexpat1-dev" "libxslt1-dev" "xmlto"

  # 32-bit
  "gcc-multilib" "g++-multilib" "libffi-dev:i386" "libexpat1-dev:i386"
)
depends=(
  "libffi8" "libexpat1" "libxml2"

  # 32-bit
  "libffi8:i386" "libexpat1:i386"
)
pacdeps=("meson-git")
provides=(
  "lib${gives}-client0=${pkgver}"
  "lib${gives}-egl1=${pkgver}"
  "lib${gives}-server0=${pkgver}"
  "lib${gives}-cursor0=${pkgver}"
  "lib${gives}-dev=${pkgver}"
  "lib${gives}-egl-backend-dev=${pkgver}"
  "lib${gives}-doc=${pkgver}"
  "lib${gives}-bin=${pkgver}"

  # 32-bit
  "lib${gives}-client0:i386=${pkgver}"
  "lib${gives}-egl1:i386=${pkgver}"
  "lib${gives}-server0:i386=${pkgver}"
  "lib${gives}-cursor0:i386=${pkgver}"
  "lib${gives}-dev:i386=${pkgver}"
  "lib${gives}-egl-backend-dev:i386=${pkgver}"
  "lib${gives}-bin:i386=${pkgver}"
)
replaces=(
  "lib${gives}-client0" "lib${gives}-egl1" "lib${gives}-server0" "lib${gives}-cursor0"
  "lib${gives}-dev" "lib${gives}-egl-backend-dev" "lib${gives}-doc" "lib${gives}-bin"
)
pkgdesc="Core Wayland window system code and protocol (development version)"
maintainer=("villamorrd <villamorrd@students.nu-moa.edu.ph>")
license=('MIT')

prepare() {
  mkdir -p "build-{32,64}"
}

build() {
  meson setup build-64 wayland --buildtype=release --prefix=/usr

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH="/usr/lib/i386-linux-gnu/pkgconfig:/usr/lib32/pkgconfig"
  meson setup build-32 wayland --buildtype=release --prefix=/usr --libdir=lib/i386-linux-gnu -Ddocumentation=false
}

check() {
  ninja -C build-32 test
  ninja -C build-64 test
}

package() {
  DESTDIR="${pkgdir}" ninja -C build-32 install
  DESTDIR="${pkgdir}" ninja -C build-64 install
}
