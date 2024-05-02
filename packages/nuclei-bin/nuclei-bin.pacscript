maintainer=("Oren Klopfer <oren@taumoda.com>")
pkgname="nuclei-bin"
gives="nuclei"
pkgver="3.1.7"
pkgdesc="Fast and customisable vulnerability scanner based on simple YAML based DSL"
source=("https://github.com/projectdiscovery/${gives}/releases/download/v${pkgver}/${gives}_${pkgver}_linux_amd64.zip")
sha256sums=("898399d8d8dfc0aee2cb7d4955912ad0c428dcfa72b4c29fe4fd93adc84df3cc")
arch=('amd64')
breaks=("${gives}" "${gives}-deb" "${gives}-git")
repology=("project: ${gives}")

package() {
  cd "${_archive}"
  # Install bin
  install -Dm755 "${gives}" "${pkgdir}/usr/bin/${gives}"
}
# vim:set ft=sh ts=2 sw=2 et:
