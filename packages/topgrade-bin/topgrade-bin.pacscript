pkgname="topgrade-bin"
gives="topgrade"
pkgver="16.0.3"
arch=('amd64' 'arm64')
sha256sums_amd64=("91ebbeb69a90db9c0f41b67be8730fac93d8c09bbba88ce6da1029943216a737")
sha256sums_arm64=("02fd832b193f0b765ab4936789b433794d8cd8f3329f9add0ddd477c95f33bb9")
source_amd64=("https://github.com/topgrade-rs/topgrade/releases/download/v${pkgver}/topgrade-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_arm64=("https://github.com/topgrade-rs/topgrade/releases/download/v${pkgver}/topgrade-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
pkgdesc="Upgrades everything on your system"
breaks=("${gives}" "${gives}-deb" "${gives}-app" "${gives}-git" "${gives}-musl-bin")
repology=("project: ${gives}")
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
