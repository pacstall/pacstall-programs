pkgname="libwayland-git"
gives="wayland"
repology=("project: ${gives}")
arch=('amd64')
pkgver="1.24.0"
url='https://wayland.freedesktop.org'
source=("git+https://gitlab.freedesktop.org/wayland/wayland.git")
makedepends=("pkg-config" "graphviz" "doxygen" "libxslt1-dev" "xmlto")
depends=("libffi8" "libexpat1" "libxml2")
provides=(
  "lib${gives}-client0=${pkgver}"
  "lib${gives}-egl1=${pkgver}"
  "lib${gives}-server0=${pkgver}"
  "lib${gives}-cursor0=${pkgver}"
  "lib${gives}-dev=${pkgver}"
  "lib${gives}-egl-backend-dev=${pkgver}"
  "lib${gives}-doc=${pkgver}"
  "lib${gives}-bin=${pkgver}"
)
conflicts=("${gives}")
replaces=(
  "lib${gives}-client0" "lib${gives}-egl1" "lib${gives}-server0" "lib${gives}-cursor0"
  "lib${gives}-dev" "lib${gives}-egl-backend-dev" "lib${gives}-doc" "lib${gives}-bin"
)
pkgdesc="Core Wayland window system code and protocol"
maintainer=("villamorrd <villamorrd@students.nu-moa.edu.ph>")
license=('MIT')

prepare() {
  cd "${gives}"
  meson build/ --buildtype=release --prefix=/usr
}

check() {
  cd "${gives}"
  ninja -C build/ test
}

package() {
  cd "${gives}"
  DESTDIR="${pkgdir}" ninja -C build/ install
}
