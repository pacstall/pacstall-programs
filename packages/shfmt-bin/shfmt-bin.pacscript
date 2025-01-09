pkgname="shfmt-bin"
gives="shfmt"
pkgver="3.10.0"
pkgdesc="Format shell programs"
url='https://github.com/mvdan/sh'
breaks=("${gives}" "${gives}-git" "${gives}-bin" "${gives}-deb" "${gives}-app")
maintainer=("wizard-28 <wiz28@pm.me>")
repology=("project: ${gives}")
arch=('amd64' 'arm64' 'armhf' 'i386')
source_amd64=("${url}/releases/download/v${pkgver}/shfmt_v${pkgver}_linux_amd64")
source_arm64=("${url}/releases/download/v${pkgver}/shfmt_v${pkgver}_linux_arm64")
source_armhf=("${url}/releases/download/v${pkgver}/shfmt_v${pkgver}_linux_arm")
source_i386=("${url}/releases/download/v${pkgver}/shfmt_v${pkgver}_linux_i386")
sha256sums_amd64=("1f57a384d59542f8fac5f503da1f3ea44242f46dff969569e80b524d64b71dbc")
sha256sums_arm64=("9d23013d56640e228732fd2a04a9ede0ab46bc2d764bf22a4a35fb1b14d707a8")
sha256sums_armhf=("493c612d8f07ad60b3030bd84d7870cca2dc87e0fb06d2fdd93b2264460668db")
sha256sums_i386=("a49ee3616afd262796e6791711ba62759d424cc85808390a5ac516af8001aa72")

package() {
  install -Dm755 "shfmt_v${pkgver}_linux_"* "${pkgdir}/usr/bin/${gives}"
}
# vim:set ft=sh ts=2 sw=2 et:
