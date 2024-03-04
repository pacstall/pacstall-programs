name="distrobox"
pkgver="1.7.0"
pkgdesc="Use any linux distribution inside your terminal"
repology=("project: distrobox")
url="https://github.com/89luca89/distrobox/archive/refs/tags/${pkgver}.tar.gz"
hash="ede6267a4e26c43535622e0ca3b27bc35bdeb5cbc97e551f094b852447457200"
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
