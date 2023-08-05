name="distrobox"
pkgver="1.5.0.2"
pkgdesc="Use any linux distribution inside your terminal"
repology=("project: distrobox")
url="https://github.com/89luca89/distrobox/archive/refs/tags/${pkgver}.tar.gz"
hash="84262770026af306d1e263258445d91790bdedecf30c813316a45adeb2a67de6"
maintainer="Marie Piontek <marie@kaifa.ch>"
gives="${name}"
breaks=("${name}" "${name}-deb" "${name}-app" "${name}-git")
optdepends=(
  "docker: enable docker usage"
  "podman: enable podman usage"
)

package() {
  sudo ./install -P "${pkgdir}/usr"
}
