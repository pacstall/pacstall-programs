pkgname="libdrm"
gives="${pkgname}"
pkgdesc="Userspace interface to kernel DRM services"
arch=("any")
pkgver="2.4.134"
provides=("libdrm2=${pkgver}"
  "libdrm-common=${pkgver}"
  "libdrm-intel1=${pkgver}"
  "libdrm-nouveau2=${pkgver}"
  "libdrm-radeon1=${pkgver}"
  "libdrm-amdgpu1=${pkgver}"
  "libdrm-dev=${pkgver}")
replaces=("libdrm2"
  "libdrm-common"
  "libdrm-intel1"
  "libdrm-nouveau2"
  "libdrm-radeon1"
  "libdrm-amdgpu1"
  "libdrm-dev")
depends=("libpciaccess0")
makedepends=("python3-docutils"
  "meson"
  "ninja-build"
  "libcairo2-dev"
  "libpciaccess-dev"
  "libc6-dev")
url='https://dri.freedesktop.org/'
source=("@drm-libdrm-${pkgver}::https://gitlab.freedesktop.org/mesa/drm/-/archive/libdrm-${pkgver}/drm-libdrm-${pkgver}.tar.gz")
sha256sums=("6b18e4834b0c061232cb5c11e98a6ecdc72ebc6bc282d124406b7a9d4e089ce2")
maintainer=("Oren Klopfer <oren@taumoda.com>" "xdavius <xdavius@github.com>")

build() {
  cd "drm-libdrm-${pkgver}"
  meson setup build \
    --prefix /usr \
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
