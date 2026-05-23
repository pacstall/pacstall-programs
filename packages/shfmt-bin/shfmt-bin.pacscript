pkgname="shfmt-bin"
gives="shfmt"
pkgver="3.12.0"
pkgdesc="Format shell programs"
url='https://github.com/mvdan/sh'
breaks=("${gives}" "${gives}-git" "${gives}-bin" "${gives}-deb" "${gives}-app")
maintainer=("wizard-28 <wiz28@pm.me>")
repology=("project: ${gives}")
arch=('amd64' 'arm64' 'armhf' 'i386')
source_amd64=("${url}/releases/download/v${pkgver}/shfmt_v${pkgver}_linux_amd64")
source_arm64=("${url}/releases/download/v${pkgver}/shfmt_v${pkgver}_linux_arm64")
source_armhf=("${url}/releases/download/v${pkgver}/shfmt_v${pkgver}_linux_arm")
source_i386=("${url}/releases/download/v${pkgver}/shfmt_v${pkgver}_linux_386")
sha256sums_amd64=("d9fbb2a9c33d13f47e7618cf362a914d029d02a6df124064fff04fd688a745ea")
sha256sums_arm64=("5f3fe3fa6a9f766e6a182ba79a94bef8afedafc57db0b1ad32b0f67fae971ba4")
sha256sums_armhf=("a93c1ed5be25ce9dd0fd62c4cf0af7453740d234725877b973e6c6a8c7598500")
sha256sums_i386=("6b67da16834a215cc8c565bfbcfaa0303809456d8cafad28cb2eeea35a88904d")

package() {
  install -Dm755 "shfmt_v${pkgver}_linux_"* "${pkgdir}/usr/bin/${gives}"
}
# vim:set ft=sh ts=2 sw=2 et:
