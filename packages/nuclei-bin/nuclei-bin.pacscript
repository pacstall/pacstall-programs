maintainer=("Oren Klopfer <oren@taumoda.com>")
pkgname="nuclei-bin"
gives="nuclei"
pkgver="3.4.5"
pkgdesc="Fast and customisable vulnerability scanner based on simple YAML based DSL"
source=("@${pkgname}~${pkgver}::https://github.com/projectdiscovery/${gives}/releases/download/v${pkgver}/${gives}_${pkgver}_linux_amd64.zip")
sha256sums=("d8ad9aa75df5aa0b1a74618a670a685e0946badca9f04780bf17fbda2ec5e451")
arch=('amd64')
breaks=("${gives}" "${gives}-deb" "${gives}-git")
repology=("project: ${gives}")

package() {
  cd "${pkgname}~${pkgver}"
  # Install bin
  install -Dm755 "${gives}" "${pkgdir}/usr/bin/${gives}"
}
# vim:set ft=sh ts=2 sw=2 et:
