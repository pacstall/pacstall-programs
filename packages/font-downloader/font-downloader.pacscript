pkgname="font-downloader"
gives="font-downloader"
arch=("any")
pkgver="10.0.0"
makedepends=("meson" "libhandy-1-dev" "gettext")
# HACK: https://github.com/pacstall/pacstall/issues/727
depends=("python3-gi" "libhandy-1-dev")
source=("@${pkgname}~${pkgver}::https://github.com/GustavoPeredo/Font-Downloader/archive/refs/tags/v${pkgver}.zip")
repology=("project: fontdownloader")
pkgdesc="Install fonts from online sources"
sha256sums=("eeafd4ac9cb0d47fd0c1512e07805d0f7a639cdbbc688647249eaee8d1753e23")
maintainer=("সৌম্যদীপ <soumyadeepghosh2004@zohomail.in>")

build() {
  cd "${pkgname}~${pkgver}"
  meson --prefix=/usr build
  ninja -C build
}
package() {
  cd "${pkgname}~${pkgver}"
  DESTDIR="${pkgdir}" ninja -C build install
}
