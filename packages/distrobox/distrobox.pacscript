pkgname="distrobox"
arch=("any")
pkgver="1.8.2.4"
pkgdesc="Use any linux distribution inside your terminal"
repology=("project: distrobox")
source=("@${pkgname}~${pkgver}::https://github.com/89luca89/distrobox/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("83eab6ba893dce56f0523a70ebfcf2a78f7785637a6895255777ef1b72d4eb89")
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
