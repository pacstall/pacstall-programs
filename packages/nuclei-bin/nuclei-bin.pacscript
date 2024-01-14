maintainer="Oren Klopfer <oren@taumoda.com>"
name="nuclei-bin"
pkgname="nuclei"
gives="nuclei"
pkgver="3.1.3"
pkgdesc="Fast and customisable vulnerability scanner based on simple YAML based DSL"
url="https://github.com/projectdiscovery/${gives}/releases/download/v${pkgver}/${gives}_${pkgver}_linux_amd64.zip"
hash="354170bb270fabb7e60063065666d4568921f13dacef9712933967f5aa91c7bb"
arch=('amd64')
breaks=("${pkgname}" "${pkgname}-deb" "${pkgname}-git")
repology=("project: ${pkgname}")

package() {
  # Install bin
  sudo install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
# vim:set ft=sh ts=2 sw=2 et:
