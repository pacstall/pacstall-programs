name="libdrm"
pkgver="2.4.118"
pkgdesc="Userspace interface to kernel DRM services"
homepage="https://dri.freedesktop.org/"
arch=('amd64' 'arm64')
depends=('libpciaccess0' 'libc6')
makedepends=('python3-docutils' 'meson' 'ninja-build' 'libcairo2-dev' 'libpciaccess-dev' 'libc6-dev')
replaces=('${name}-dev' '${name}-nouveau2' '${name}-radeon1' '${name}-amdgpu1')
url="https://dri.freedesktop.org/${name}/${name}-${pkgver}.tar.xz"
hash="a777bd85f2b5fc9c57f886c82058300578317cafdbc77d0a769d7e9a9567ab88"
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
