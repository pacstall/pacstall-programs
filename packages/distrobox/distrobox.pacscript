pkgname="distrobox"
arch=("any")
pkgver="1.8.2.5"
pkgdesc="Use any linux distribution inside your terminal"
repology=("project: distrobox")
source=("@${pkgname}~${pkgver}::https://github.com/89luca89/distrobox/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("0c3bc4785ee3be3b89f93abb7cc0a9f60e56989e81319af140a4b60403b18f80")
maintainer=("Marie Piontek <marie@kaifa.ch>")
gives="${pkgname}"
breaks=("${pkgname}" "${pkgname}-deb" "${pkgname}-app" "${pkgname}-git")
optdepends=(
  "docker.io: enable docker usage"
  "podman: enable podman usage"
)

package() {
  cd "${pkgname}~${pkgver}"
  ./install -P "${pkgdir}/usr"
}
