pkgname="topgrade-bin"
gives="topgrade"
pkgver="16.0.2"
arch=('amd64' 'arm64')
sha256sums_amd64=("60d6d89c81254d0ec60d9d3aacfbff281db39d62901b3eb0ca77d6f3bcea37a4")
sha256sums_arm64=("f038935bd57ccf018718d10d95604deb385c1e8957fc827c215e8848568de95c")
source_amd64=("https://github.com/topgrade-rs/topgrade/releases/download/v${pkgver}/topgrade-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_arm64=("https://github.com/topgrade-rs/topgrade/releases/download/v${pkgver}/topgrade-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
pkgdesc="Upgrades everything on your system"
breaks=("${gives}" "${gives}-deb" "${gives}-app" "${gives}-git" "${gives}-musl-bin")
repology=("project: ${gives}")
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
