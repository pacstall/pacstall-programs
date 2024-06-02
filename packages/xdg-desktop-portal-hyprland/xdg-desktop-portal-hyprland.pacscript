pkgname="xdg-desktop-portal-hyprland"
pkgver="1.3.1"
_protocolver="4d29e48433270a2af06b8bc711ca1fe5109746cd"
pkgdesc='xdg-desktop-portal backend for hyprland'
url="https://github.com/hyprwm/${pkgname}"
maintainer=("Oren Klopfer <oren@taumoda.com>")
arch=("amd64" "arm64")
compatible=('ubuntu:devel' 'debian:sid' 'ubuntu:oracular' 'ubuntu:noble')
license=('MIT')
provides=("xdg-desktop-portal-impl")
pacdeps=("hyprlang")
depends=("pipewire" "xdg-desktop-portal" "grim" "slurp")
makedepends=("cmake" "pkg-config" "meson" "ninja-build" "scdoc" "wayland-utils" "wayland-protocols" "libgbm-dev" "libinih-dev" "uuid-dev" "qt6-base-dev" "qt6-wayland-dev" "libpipewire-0.3-dev" "libsdbus-c++-dev" "libsdbus-c++-bin" "libdrm-dev")
optdepends=('grim: required for the screenshot portal to function'
  'slurp: support for interactive mode for the screenshot portal')
_archive="${pkgname}-${pkgver}"
source=("${url}/archive/v${pkgver}/${_archive}.tar.gz"
  "https://github.com/hyprwm/hyprland-protocols/archive/${_protocolver}.tar.gz")
sha256sums=('60b390f326b84cc52657b735e3d7ba8f03aa3363672100dba47580984491611f'
  '5f6be4d870e94314f05ec7ff9c9c1f028748230ff80a7f89aeaf66c08e5c70e0')

prepare() {
  cd "${_archive}/subprojects"
  rm -rf hyprland-protocols sdbus-cpp
  ln -sfT "${srcdir}/hyprland-protocols-${_protocolver}" hyprland-protocols
}

build() {
  echo '[preferred]
default=hyprland;gtk' | tee hyprland-portals.conf > /dev/null
  cd "${_archive}"
  cmake -B build \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_INSTALL_LIBEXECDIR=/usr/lib \
    -D CMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cd "${_archive}"
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm0644 -t "${pkgdir}/usr/share/xdg-desktop-portal/" "${srcdir}/hyprland-portals.conf"
  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
