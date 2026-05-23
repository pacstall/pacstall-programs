maintainer=("Oren Klopfer <oren@taumoda.com>")
pkgname="nuclei-bin"
gives="nuclei"
pkgver="3.7.0"
pkgdesc="Fast and customisable vulnerability scanner based on simple YAML based DSL"
source=("@${pkgname}~${pkgver}::https://github.com/projectdiscovery/${gives}/releases/download/v${pkgver}/${gives}_${pkgver}_linux_amd64.zip")
sha256sums=("aadbae75a5bd2cec08d9e1ae340a4f15dc95c159e9369ed805b36f97e6ee2062")
arch=('amd64')
breaks=("${gives}" "${gives}-deb" "${gives}-git")
repology=("project: ${gives}")

package() {
  cd "${pkgname}~${pkgver}"
  # Install bin
  install -Dm755 "${gives}" "${pkgdir}/usr/bin/${gives}"
}
# vim:set ft=sh ts=2 sw=2 et:
