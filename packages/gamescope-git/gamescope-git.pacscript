pkgname="gamescope-git"
gives="gamescope"
repology=("project: gamescope")
arch=('amd64')
pkgver="3.16.14"
url='https://github.com/ValveSoftware/gamescope'
source=("git+https://github.com/ValveSoftware/gamescope.git")
makedepends=(
  "cmake" "glslang-dev" "glslang-dev" "glslang-tools"
  "libavif-dev" "libbenchmark-dev" "libdecor-0-dev" "libdrm-dev" "libeis-dev"
  "libinput-dev" "liblcms2-dev" "libluajit-5.1-dev" "libpipewire-0.3-dev"
  "libpixman-1-dev" "libseat-dev" "libvulkan-dev" "libx11-dev" "libx11-xcb-dev"
  "libxcb-composite0-dev" "libxcb-errors-dev" "libxcb-ewmh-dev" "libxcb-icccm4-dev" "libxcb-res0-dev"
  "libxcomposite-dev" "libxcursor-dev" "libxdamage-dev" "libxkbcommon-dev" "libxmu-dev"
  "libxres-dev" "libxtst-dev" "libxxf86vm-dev" "pkg-config" "vkroots-headers" "xwayland"
)
depends=(
  "glslang-tools" "libavif16" "libbenchmark1.9.1" "libdecor-0-0" "libdrm2"
  "libeis1" "libinput10" "liblcms2-2" "libluajit-5.1-2" "libpipewire-0.3-0t64"
  "libpixman-1-0" "libseat1" "libvulkan1" "libxcb-composite0" "libxcb-errors0"
  "libxcb-icccm4" "libxcb-res0" "libxcomposite1" "libxcursor1" "libxdamage1"
  "libxkbcommon0" "libxmu6" "libxres1" "libxtst6" "libxxf86vm1" "xwayland"
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
