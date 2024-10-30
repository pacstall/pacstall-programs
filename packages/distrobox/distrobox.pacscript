pkgname="distrobox"
arch=("amd64")
pkgver="1.8.0"
pkgdesc="Use any linux distribution inside your terminal"
repology=("project: distrobox")
source=("https://github.com/89luca89/distrobox/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("72d8d825b6aad63e03e0b92376e6ead9c053c1e676acab3c7eaac9be2929d0a2")
maintainer=("Marie Piontek <marie@kaifa.ch>")
gives="${pkgname}"
breaks=("${pkgname}" "${pkgname}-deb" "${pkgname}-app" "${pkgname}-git")
optdepends=(
  "docker.io: enable docker usage"
  "podman: enable podman usage"
)

package() {
  cd "${_archive}"
  ./install -P "${pkgdir}/usr"
}
