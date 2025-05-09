maintainer=("Oren Klopfer <oren@taumoda.com>")
pkgname="nuclei-bin"
gives="nuclei"
pkgver="3.4.2"
pkgdesc="Fast and customisable vulnerability scanner based on simple YAML based DSL"
source=("@${pkgname}~${pkgver}::https://github.com/projectdiscovery/${gives}/releases/download/v${pkgver}/${gives}_${pkgver}_linux_amd64.zip")
sha256sums=("0dd53dfee3d6d0310705de13ac9ec88a10f4270d8d9068e502cbeb9257b42397")
arch=('amd64')
breaks=("${gives}" "${gives}-deb" "${gives}-git")
repology=("project: ${gives}")

package() {
  cd "${pkgname}~${pkgver}"
  # Install bin
  install -Dm755 "${gives}" "${pkgdir}/usr/bin/${gives}"
}
# vim:set ft=sh ts=2 sw=2 et:
