_pkgname="morewaita"
pkgname="morewaita-icon-theme"
arch=("all")
pkgver="48.4"
maintainer=("Rodrigo Tavares <dev@rodrigotavar.es>")
source=("${pkgname}~${pkgver}::https://github.com/somepaulo/MoreWaita.git#tag=v${pkgver}")
makedepends=("meson" "ninja-build")
pkgdesc="Adwaita style extra icons theme for Gnome Shell"
repology=("project: ${pkgname}")
provides=("${_pkgname}" "${_pkgname}-icon-theme")
conflicts=("${_pkgname}" "${_pkgname}-icon-theme-git")
replaces=("${conflicts[@]}")

build() {
  cd "${pkgname}~${pkgver}"
  meson "build" --prefix="${pkgdir}/usr"
}

package() {
  cd "${pkgname}~${pkgver}"
  ninja -C "build" install
}
