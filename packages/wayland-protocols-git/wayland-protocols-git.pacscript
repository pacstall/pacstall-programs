pkgname="wayland-protocols-git"
gives="wayland-protocols"
pkgver="1.23"
pkgrel=1
pkgdesc='Wayland protocols that add functionalities not available in the core protocol'
arch=('any')
url='https://wayland.freedesktop.org/'
makedepends=('git' 'ninja-build' 'libwayland-dev')
pacdeps=("meson-git")
source=("git+https://gitlab.freedesktop.org/wayland/wayland-protocols.git")
sha256sums=('SKIP')

prepare() {
  mkdir -p "${gives}/build"
}

build() {
  meson build "${gives}" --buildtype=release --prefix=/usr
  ninja -C build
}

check() {
  ninja -C build test
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dt "${pkgdir}/usr/share/licenses/${gives}" -m 644 "${gives}/COPYING"
}
