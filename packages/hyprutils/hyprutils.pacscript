pkgname="hyprutils"
pkgver="0.1.2"
pkgrel="1"
arch=("amd64" "arm64")
url="https://github.com/hyprwm/hyprutils"
source=("https://github.com/hyprwm/hyprutils.git#branch=main")
gives="hyprutils"
pkgdesc="Hyprland utility tools"
makedepends=("cmake" "libpixman-1-dev")
incompatible=('debian:*')
maintainers=("Bisher Al Masri <bisherk.almasri@gmail.com>")

build() {
  cd "hyprutils"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -S . -B build
  cmake --build build --config Release --target all -j"$(nproc 2>/dev/null || getconf NPROCESSORS_CONF)" DESTDIR="$(pkgdir)"
}

package() {
  cd "hyprutils"
  cmake --install build --prefix="${pkgdir}/usr"
}
