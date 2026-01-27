pkgname="pfetch-bin"
gives="pfetch"
arch=("amd64")
pkgver="1.10.0"
source=("@${pkgname}~${pkgver}::https://github.com/Un1q32/${gives}/archive/refs/tags/${pkgver}.zip")
breaks=("${gives}" "${gives}-bin" "${gives}-deb" "${gives}-app" "${gives}-git")
pkgdesc="A lightweight and simple fetch tool"
sha256sums=("38548f03ec48415b41026157486ac577dcc533684ede9054898972e3a17d752b")
repology=("project: ${gives}")
maintainer=("Zahrun <zahrunAtmurenaDotio>")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${gives}"
}
