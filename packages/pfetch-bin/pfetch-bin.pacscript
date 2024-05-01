pkgname="pfetch-bin"
gives="pfetch"
pkgver="0.6.0"
source=("https://github.com/dylanaraps/${gives}/archive/refs/tags/${pkgver}.zip")
breaks=("${gives}" "${gives}-bin" "${gives}-deb" "${gives}-app" "${gives}-git")
pkgdesc="A lightweight and simple fetch tool"
sha256sums=("ec85100a912c0bdd06a82a9647d19a5c6d1d51c3a262d60b9ac8f17570fbfb39")
repology=("project: ${gives}")
maintainer=("Zahrun <Zahrun@github.com>")

package() {
  cd "${_archive}"
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE.md" -t "${pkgdir}/usr/share/licenses/${gives}"
}
