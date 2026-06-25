pkgname="pfetch-bin"
gives="pfetch"
arch=("amd64")
pkgver="1.11.0"
source=("@${pkgname}~${pkgver}::https://github.com/Un1q32/${gives}/archive/refs/tags/${pkgver}.zip")
breaks=("${gives}" "${gives}-bin" "${gives}-deb" "${gives}-app" "${gives}-git")
pkgdesc="A lightweight and simple fetch tool"
sha256sums=("4cd911002204382b4ac5decdacc1d8701088eb4e70183a1466111dd9d4c0da08")
repology=("project: ${gives}")
maintainer=("Zahrun <zahrunAtmurenaDotio>")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${gives}"
}
