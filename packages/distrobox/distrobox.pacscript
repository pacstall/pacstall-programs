pkgname="distrobox"
pkgver="1.7.2.1"
pkgdesc="Use any linux distribution inside your terminal"
repology=("project: distrobox")
source=("https://github.com/89luca89/distrobox/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("ff2cca0c6334fff6ed577d23f68a6746ad4009f42d8a45eef5ca3850c895a4bb")
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
