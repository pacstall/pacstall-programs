name="pfetch-bin"
pkgname="pfetch"
pkgver="0.6.0"
source=("https://github.com/dylanaraps/${pkgname}/archive/refs/tags/${pkgver}.zip")
breaks=("${pkgname}" "${pkgname}-bin" "${pkgname}-deb" "${pkgname}-app" "${pkgname}-git")
pkgdesc="A lightweight and simple fetch tool"
hash=("ec85100a912c0bdd06a82a9647d19a5c6d1d51c3a262d60b9ac8f17570fbfb39")
repology=("project: ${pkgname}")
maintainer="Zahrun <Zahrun@github.com>"

package() {
  sudo install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin"
  sudo install -Dm644 "LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
