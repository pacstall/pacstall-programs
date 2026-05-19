pkgname="vulkan-low-latency-layer-git"
gives="vulkan-low-latency-layer"
_gitname="low_latency_layer"
pkgdesc="Vulkan layer for hardware agnostic input latency reduction"
repology=("project: ${gives}")
arch=('x86_64')
pkgver="0.1.0"
url='https://github.com/Korthos-Software/low_latency_layer'
license=('MIT')
source=("git+https://github.com/Korthos-Software/low_latency_layer.git")
sha256sums=('SKIP')
provides=("${gives}")
conflicts=("${gives}")
depends=(
  "libgcc-s1"
)
makedepends=(
  "build-essential"
  "cmake"
  "vulkan-utility-libraries-dev"
  "libvulkan-dev"
  "glslang-dev"
  "glslc"
)
maintainer=("pejuton <pejuton@proton.me>")

build() {
  cmake -S "${_gitname}" -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -Wno-dev

  cmake --build build --parallel "${NCPU}"
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 "${_gitname}"/LICENSE -t "${pkgdir}/usr/share/licenses/${gives}"
}
