maintainer="Oren Klopfer <oren@taumoda.com>"
name="nuclei-bin"
pkgname="nuclei"
gives="nuclei"
pkgver="2.9.15"
pkgdesc="Fast and customisable vulnerability scanner based on simple YAML based DSL"
url="https://github.com/projectdiscovery/${gives}/releases/download/v${pkgver}/${gives}_${pkgver}_linux_amd64.zip"
hash="d2a20042e1d4b6c85d79c9abff4658915caa440c26e104fd5fcfbab38527c66c"
arch=('amd64')
breaks=("${pkgname}" "${pkgname}-deb" "${pkgname}-git")
repology=("project: ${pkgname}")

package() {
  # Install bin
  sudo install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
# vim:set ft=sh ts=2 sw=2 et:
