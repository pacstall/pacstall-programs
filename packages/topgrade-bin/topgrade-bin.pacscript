pkgname="topgrade-bin"
gives="topgrade"
pkgver="16.0.4"
arch=('amd64' 'arm64')
sha256sums_amd64=("f4b42cc5a8e002282230f3bc5d2c95ac0285b71ffd360b0cf9d3a3765c6fa4e2")
sha256sums_arm64=("f3bb23aea80767a097bcba3d8f9cd7fec96b194249c59ba72fcca9f19f063b44")
source_amd64=("https://github.com/topgrade-rs/topgrade/releases/download/v${pkgver}/topgrade-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_arm64=("https://github.com/topgrade-rs/topgrade/releases/download/v${pkgver}/topgrade-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
pkgdesc="Upgrades everything on your system"
breaks=("${gives}" "${gives}-deb" "${gives}-app" "${gives}-git" "${gives}-musl-bin")
repology=("project: ${gives}")
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
