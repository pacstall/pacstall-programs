pkgname="libdrm"
gives="${pkgname}"
pkgdesc="Userspace interface to kernel DRM services"
pkgver="2.4.124"
arch=("any")
depends=("libpciaccess0" "libpciaccess-dev")
makedepends=("python3-docutils" "meson" "ninja-build" "libcairo2-dev" "libpciaccess-dev" "libc6-dev")
url="https://dri.freedesktop.org/"
source=("https://gitlab.freedesktop.org/mesa/drm/-/archive/libdrm-${pkgver}/drm-libdrm-${pkgver}.tar.gz")
sha256sums=("49c077f3938147e7c321fe89255eb189c1be68f6ed0aa36e29d38e3db0e84e08")
maintainer=("Oren Klopfer <oren@taumoda.com>" "xdavius <xdavius@github.com>")
repology=("project: libdrm")

#Uncomment provides to replaces/upgrade systemlib : use at your own risk or for devel purpose
#provides=("libdrm2=${pkgver}" "libdrm-common=${pkgver}" "libdrm-intel1=${pkgver}" "libdrm-nouveau2=${pkgver}" "libdrm-radeon1=${pkgver}" "libdrm-amdgpu1=${pkgver}" "libdrm-dev=${pkgver}")

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
