maintainer=("Oren Klopfer <oren@taumoda.com>")
pkgname="nuclei-bin"
gives="nuclei"
pkgver="3.3.5"
pkgdesc="Fast and customisable vulnerability scanner based on simple YAML based DSL"
source=("@${pkgname}~${pkgver}::https://github.com/projectdiscovery/${gives}/releases/download/v${pkgver}/${gives}_${pkgver}_linux_amd64.zip")
sha256sums=("7daa9af79972f0c483fedd14d20badefeef9685eddb7f35f2fb1e7e59f08309d")
arch=('amd64')
breaks=("${gives}" "${gives}-deb" "${gives}-git")
repology=("project: ${gives}")

package() {
  cd "${pkgname}~${pkgver}"
  # Install bin
  install -Dm755 "${gives}" "${pkgdir}/usr/bin/${gives}"
}
# vim:set ft=sh ts=2 sw=2 et:
