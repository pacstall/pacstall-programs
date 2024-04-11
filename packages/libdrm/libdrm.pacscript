pkgname="libdrm"
pkgver="2.4.120"
pkgrel="2"
pkgdesc="Userspace interface to kernel DRM services"
url="https://dri.freedesktop.org/"
arch=("amd64" "arm64")
depends=("libpciaccess0" "libc6")
makedepends=("python3-docutils" "meson" "ninja-build" "libcairo2-dev" "libpciaccess-dev" "libc6-dev")
provides=("${pkgname}" "${pkgname}-dev")
replaces=("${pkgname}-dev")
source=("https://dri.freedesktop.org/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=("3bf55363f76c7250946441ab51d3a6cc0ae518055c0ff017324ab76cdefb327a")
maintainer=("Oren Klopfer <oren@taumoda.com>")

build() {
  cd "${_archive}"
  meson setup build \
    -D udev=true \
    -D etnaviv=disabled \
    -D freedreno=disabled \
    -D vc4=disabled \
    -D valgrind=disabled \
    -D install-test-programs=true
  meson compile -C build
}

package() {
  cd "${_archive}"
  meson install -C build --destdir "${pkgdir}"
}
