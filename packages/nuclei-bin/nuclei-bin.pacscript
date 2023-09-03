maintainer="Oren Klopfer <oren@taumoda.com>"
name="nuclei-bin"
pkgname="nuclei"
gives="nuclei"
pkgver="2.9.13"
pkgdesc="Fast and customisable vulnerability scanner based on simple YAML based DSL"
url="https://github.com/projectdiscovery/${gives}/releases/download/v${pkgver}/${gives}_${pkgver}_linux_amd64.zip"
hash="f57aa6ad5bb6aa9ceb3d2cc336a9761af0593509ee617f2fb804506fc583c8b6"
arch=('amd64')
breaks=("${pkgname}" "${pkgname}-deb" "${pkgname}-git")
repology=("project: ${pkgname}")

package() {
  # Install bin
  sudo install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
# vim:set ft=sh ts=2 sw=2 et:
