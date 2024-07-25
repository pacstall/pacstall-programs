pkgbase="libdrm"
pkgname=("libdrm2"
  "libdrm-common"
  "libdrm-intel1"
  "libdrm-nouveau2"
  "libdrm-radeon1"
  "libdrm-amdgpu1"
  "libdrm-dev"
  "libdrm")
pkgver="2.4.122"
pkgrel="1"
pkgdesc="Userspace interface to kernel DRM services"
url="https://dri.freedesktop.org/"
source=("https://gitlab.freedesktop.org/mesa/drm/-/archive/libdrm-${pkgver}/drm-libdrm-${pkgver}.tar.gz")
arch=("amd64")
sha256sums=("7babfa22795dda27f32ed78b89bf93bfd341043e254bd42734cb569b602481d3")
maintainer=("Oren Klopfer <oren@taumoda.com>" "xdavius <xdavius@github.com>")

package_libdrm2() {
  gives="libdrm2"
  depends="${pkgbase}"
}

package_libdrm-common() {
  gives="libdrm-common"
  depends="${pkgbase}"
}

package_libdrm-intel1() {
  gives="libdrm-intel1"
  depends="${pkgbase}"
}

package_libdrm-nouveau2() {
  gives="libdrm-nouveau2"
  depends="${pkgbase}"
}

package_libdrm-radeon1() {
  gives="libdrm-radeon1"
  depends="${pkgbase}"
}

package_libdrm-amdgpu1() {
  gives="libdrm-amdgpu1"
  depends="${pkgbase}"
}

package_libdrm-dev() {
  gives="libdrm-dev"
  depends="${pkgbase}"
}

package_libdrm() {
  gives="libdrm"
  depends=(
    "libdrm2"
    "libdrm-common"
    "libdrm-intel1"
    "libdrm-nouveau2"
    "libdrm-radeon1"
    "libdrm-amdgpu1"
    "libdrm-dev"
    "libpciaccess0"
    "libpciaccess-dev"
  )
  makedepends=(
    "python3-docutils"
    "meson"
    "ninja-build"
    "libcairo2-dev"
    "libpciaccess-dev"
    "libc6-dev"
  )

  #build so avoid build for each packages
  cd "${srcdir}/drm-libdrm-${pkgver}"
  meson setup build \
    --prefix /usr \
    --buildtype plain \
    --wrap-mode nofallback \
    -D udev=false \
    -D valgrind=disabled
  meson configure --no-pager build
  ninja -C build

  #package
  cd "${srcdir}/drm-libdrm-${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
}
