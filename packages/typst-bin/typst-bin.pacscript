pkgname="typst-bin"
gives="typst"
pkgver="0.14.2"
arch=("amd64" "arm64" "armhf")
url='https://typst.app'
license=('Apache-2.0')
repology=("project: ${gives}")
breaks=("${gives}" "${gives}-git" "${gives}-deb")
pkgdesc="Markup-based typesetting system that is powerful and easy to learn"
maintainer=("Huang Rui <vowstar@gmail.com>")
source_amd64=("https://github.com/${gives}/${gives}/releases/download/v${pkgver}/${gives}-x86_64-unknown-linux-musl.tar.xz")
sha256sums_amd64=("a6044cbad2a954deb921167e257e120ac0a16b20339ec01121194ff9d394996d")
source_arm64=("https://github.com/${gives}/${gives}/releases/download/v${pkgver}/${gives}-aarch64-unknown-linux-musl.tar.xz")
sha256sums_arm64=("491b101aa40a3a7ea82a3f8a6232cabb4e6a7e233810082e5ac812d43fdcd47a")
source_armhf=("https://github.com/${gives}/${gives}/releases/download/v${pkgver}/${gives}-armv7-unknown-linux-musleabi.tar.xz")
sha256sums_armhf=("55bfbeadebc01c2116f1fea606dcd72fe30e1d8b02fbe61d5ed77d68c6ece298")

package() {
  cd "${gives}"-*-unknown-linux-*
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 NOTICE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ft=sh ts=2 sw=2 et:
