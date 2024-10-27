pkgname="vkroots-git"
gives="vkroots-headers"
arch=("any")
pkgver="0.1"
pkgdesc="A stupid simple method of making Vulkan layers, at home!"
url='https://github.com/Joshua-Ashton/vkroots'
license=('LGPL-2.1-or-later')
makedepends=("meson" "ninja-build" "libvulkan-dev")
replaces=("${gives}")
breaks=("${gives}")
source=("git+https://github.com/Joshua-Ashton/vkroots.git")
maintainer=("xdavius <xdavius@gmail.com>")

build() {
  meson --prefix=/usr "${srcdir}/vkroots" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  cd "${srcdir}/vkroots"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
