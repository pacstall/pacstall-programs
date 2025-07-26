pkgname="gamescope-git"
gives="gamescope"
repology=("project: gamescope")
arch=('amd64')
pkgver="3.16.14"
url='https://github.com/ValveSoftware/gamescope'
source=("git+https://github.com/ValveSoftware/gamescope.git")
makedepends=(
  "cmake" "glslang-dev" "libavif-dev" "libbenchmark-dev" "libeis-dev"
  "libinput-dev" "liblcms2-dev" "libluajit-5.1-dev" "libpipewire-0.3-dev"
  "libseat-dev" "libxcb-composite0-dev" "libxcb-errors-dev" "libxcb-ewmh-dev"
  "libxcb-icccm4-dev" "libxcb-res0-dev" "pkg-config"
)
depends=(
  "glslang-tools" "libavif16" "libbenchmark1.9.1" "libeis1" "libinput10"
  "liblcms2-2" "libluajit-5.1-2" "libpipewire-0.3-0t64" "libseat1" "libxcb-composite0"
  "libxcb-errors0" "libxcb-icccm4" "libxcb-res0"
)
pacdeps=("meson-git" "wayland-protocols-git")
conflicts=("${gives}")
pkgdesc="Micro-compositor for game scaling"
maintainer=("villamorrd <villamorrd@students.nu-moa.edu.ph>")
license=('BSD-2-Clause')
external_connection=true

build() {
  cd "${gives}"
  meson setup build/ -Dpipewire=enabled --buildtype=release --prefix=/usr
  ninja -C build/ -j"${NCPU}"
}

package() {
  cd "${gives}"
  DESTDIR="${pkgdir}" meson install -C build/ --skip-subprojects
}
