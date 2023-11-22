name="distrobox"
pkgver="1.6.0.1"
pkgdesc="Use any linux distribution inside your terminal"
repology=("project: distrobox")
url="https://github.com/89luca89/distrobox/archive/refs/tags/${pkgver}.tar.gz"
hash="d6b1330b56f6a1bf844c26a27d87f39efd8ae088ed3063f6513d48cf9c18f57e"
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
