pkgname="shfmt-bin"
gives="shfmt"
pkgver="3.13.1"
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
sha256sums_amd64=("fb096c5d1ac6beabbdbaa2874d025badb03ee07929f0c9ff67563ce8c75398b1")
sha256sums_arm64=("32d92acaa5cd8abb29fc49dac123dc412442d5713967819d8af2c29f1b3857c7")
sha256sums_armhf=("f6c23b95971bcc5ebf86411bccefb79f1e99f8efe7c722d980a3f244838b1398")
sha256sums_i386=("5f9a2c46249dab66d7767df676083ea6a3313831ca9f4bc29e4c21af87bd4f5e")

package() {
  install -Dm755 "shfmt_v${pkgver}_linux_"* "${pkgdir}/usr/bin/${gives}"
}
# vim:set ft=sh ts=2 sw=2 et:
