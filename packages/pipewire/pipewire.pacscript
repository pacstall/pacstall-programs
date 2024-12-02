pkgname="pipewire"
arch=("any")
pkgver="0.3.65"
makedepends=("meson" "libdbus-1-dev" "debhelper-compat" "findutils" "libasound2-dev" "libavcodec-dev" "libavfilter-dev" "libavformat-dev" "libdbus-1-dev" "libglib2.0-dev" "libgstreamer1.0-dev" "libgstreamer-plugins-base1.0-dev" "libsbc-dev" "libsdl2-dev" "libudev-dev" "libva-dev" "libv4l-dev" "libx11-dev" "ninja-build" "pkg-config" "python3-docutils" "python3-pip")
source=("@${pkgname}~${pkgver}::https://gitlab.freedesktop.org/${pkgname}/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.zip")
url='https://pipewire.org/'
maintainer=("Elsie19 <elsie19@pm.me>")
pkgdesc="Server and user space API to deal with multimedia pipelines"
sha256sums=("f5fbe0028b56a9e9cc6c9fbb4e3e73d108bb818895f6fed3cd62d1a1b6fc4c30")
incompatible=('debian:stable')

prepare() {
  cd "${pkgname}~${pkgver}"
  meson setup builddir
}

build() {
  cd "${pkgname}~${pkgver}"
  meson configure builddir -Dprefix=/usr
  ninja -C builddir
}

package() {
  cd "${pkgname}~${pkgver}"
  cd builddir/
  DESTDIR="${pkgdir}" meson install
}
