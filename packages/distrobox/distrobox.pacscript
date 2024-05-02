pkgname="distrobox"
pkgver="1.7.1"
pkgdesc="Use any linux distribution inside your terminal"
repology=("project: distrobox")
source=("https://github.com/89luca89/distrobox/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("a39ce0b579e8e7c7599b5effaf53462814d443ce5d30131e19db2f8b830f242f")
maintainer=("Marie Piontek <marie@kaifa.ch>")
gives="${pkgname}"
breaks=("${pkgname}" "${pkgname}-deb" "${pkgname}-app" "${pkgname}-git")
optdepends=(
  "docker: enable docker usage"
  "podman: enable podman usage"
)

package() {
  cd "${_archive}"
  ./install -P "${pkgdir}/usr"
}
