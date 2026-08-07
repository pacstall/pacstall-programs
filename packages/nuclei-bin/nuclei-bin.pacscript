maintainer=("Oren Klopfer <oren@taumoda.com>")
pkgname="nuclei-bin"
gives="nuclei"
pkgver="3.9.0"
pkgdesc="Fast and customisable vulnerability scanner based on simple YAML based DSL"
source=("@${pkgname}~${pkgver}::https://github.com/projectdiscovery/${gives}/releases/download/v${pkgver}/${gives}_${pkgver}_linux_amd64.zip")
sha256sums=("05357e07886d9670e9c54325ec8afd362d03610c87e2aa1455886ad3f7b58519")
arch=('amd64')
breaks=("${gives}" "${gives}-deb" "${gives}-git")
repology=("project: ${gives}")

package() {
  cd "${pkgname}~${pkgver}"
  # Install bin
  install -Dm755 "${gives}" "${pkgdir}/usr/bin/${gives}"
}
# vim:set ft=sh ts=2 sw=2 et:
