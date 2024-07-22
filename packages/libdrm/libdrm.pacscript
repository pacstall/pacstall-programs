pkgname="libdrm"
gives="${pkgname}-dev"
pkgver="2.4.122"
pkgrel="1"
pkgdesc="Userspace interface to kernel DRM services"
url="https://dri.freedesktop.org/"
arch=("amd64" "arm64")
depends=("libpciaccess0")
makedepends=("python3-docutils" "meson" "ninja-build" "libcairo2-dev" "libpciaccess-dev" "libc6-dev")
replaces=("${pkgname}-dev")
source=("https://gitlab.freedesktop.org/mesa/drm/-/archive/libdrm-${pkgver}/drm-libdrm-${pkgver}.tar.gz")
sha256sums=("7babfa22795dda27f32ed78b89bf93bfd341043e254bd42734cb569b602481d3")
maintainer=("Oren Klopfer <oren@taumoda.com>" "xdavius <xdavius@github.com>")

build() {
  cd "drm-libdrm-${pkgver}"
  meson setup build \
    --prefix /usr/local \
    --buildtype plain \
    --wrap-mode nofallback \
    -D udev=false \
    -D valgrind=disabled
  meson configure --no-pager build
  ninja -C build
}

package() {
  cd "drm-libdrm-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
}
