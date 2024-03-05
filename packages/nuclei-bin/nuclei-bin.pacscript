maintainer="Oren Klopfer <oren@taumoda.com>"
name="nuclei-bin"
pkgname="nuclei"
gives="nuclei"
pkgver="3.1.7"
pkgdesc="Fast and customisable vulnerability scanner based on simple YAML based DSL"
source=("https://github.com/projectdiscovery/${gives}/releases/download/v${pkgver}/${gives}_${pkgver}_linux_amd64.zip")
hash=("898399d8d8dfc0aee2cb7d4955912ad0c428dcfa72b4c29fe4fd93adc84df3cc")
arch=('amd64')
breaks=("${pkgname}" "${pkgname}-deb" "${pkgname}-git")
repology=("project: ${pkgname}")

package() {
  # Install bin
  sudo install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
# vim:set ft=sh ts=2 sw=2 et:
