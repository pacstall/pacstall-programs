pkgname="distrobox"
pkgver="1.7.0"
pkgdesc="Use any linux distribution inside your terminal"
repology=("project: distrobox")
source=("https://github.com/89luca89/distrobox/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("ede6267a4e26c43535622e0ca3b27bc35bdeb5cbc97e551f094b852447457200")
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
