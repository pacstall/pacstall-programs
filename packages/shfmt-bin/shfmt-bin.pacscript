pkgname="shfmt-bin"
gives="shfmt"
pkgver="3.11.0"
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
sha256sums_amd64=("1904ec6bac715c1d05cd7f6612eec8f67a625c3749cb327e5bfb4127d09035ff")
sha256sums_arm64=("b3976121710fd4b12bf641b0a7fb2686da598fb0da9f148c641b61b54cfa3407")
sha256sums_armhf=("00a243112f22a94594a82cb9399b086cf51441e3d9fef98b1203d633863506ed")
sha256sums_i386=("4bd973b2146dbb49a1aff9c16a782b0adeec974728ac063ac793f884f6a951f7")

package() {
  install -Dm755 "shfmt_v${pkgver}_linux_"* "${pkgdir}/usr/bin/${gives}"
}
# vim:set ft=sh ts=2 sw=2 et:
