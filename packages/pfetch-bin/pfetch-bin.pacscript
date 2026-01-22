pkgname="pfetch-bin"
gives="pfetch"
arch=("amd64")
pkgver="0.6.0"
source=("@${pkgname}~${pkgver}::https://github.com/dylanaraps/${gives}/archive/refs/tags/${pkgver}.zip")
breaks=("${gives}" "${gives}-bin" "${gives}-deb" "${gives}-app" "${gives}-git")
pkgdesc="A lightweight and simple fetch tool"
sha256sums=("ec85100a912c0bdd06a82a9647d19a5c6d1d51c3a262d60b9ac8f17570fbfb39")
repology=("project: ${gives}")
maintainer=("Zahrun <zahrunAtmurenaDotio>")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE.md" -t "${pkgdir}/usr/share/licenses/${gives}"
}
