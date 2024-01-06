name="libdrm"
pkgver="2.4.119"
pkgdesc="Userspace interface to kernel DRM services"
homepage="https://dri.freedesktop.org/"
arch=("amd64" "arm64")
depends=("libpciaccess0" "libc6")
makedepends=("python3-docutils" "meson" "ninja-build" "libcairo2-dev" "libpciaccess-dev" "libc6-dev")
provides=("${name}" "${name}-dev")
replace=("${name}-dev")
url="https://dri.freedesktop.org/${name}/${name}-${pkgver}.tar.xz"
hash="0a49f12f09b5b6e68eaaaff3f02ca7cff9aa926939b212d343161d3e8ac56291"
maintainer="Oren Klopfer <oren@taumoda.com>"

build() {
  meson setup build \
    -D udev=true \
    -D etnaviv=disabled \
    -D freedreno=disabled \
    -D vc4=disabled \
    -D valgrind=disabled \
    -D install-test-programs=true
  sudo meson compile -C build
}

package() {
  sudo meson install -C build --destdir "${pkgdir}"
}
