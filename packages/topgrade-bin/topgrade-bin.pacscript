pkgname="topgrade-bin"
gives="topgrade"
pkgver="16.0.1"
pkgrel="2"
arch=('amd64' 'arm64')
sha256sums_amd64=("5149ee536b15764bcdecb3fe971d99edfb82096f9f8112be3ff6f4e6acb6557f")
sha256sums_arm64=("d114d4de129754d8e997d5a5021c42f11a8c5d0545ebd17dd1b55e55c4a2e61f")
source_amd64=("https://github.com/topgrade-rs/topgrade/releases/download/v${pkgver}/topgrade-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_arm64=("https://github.com/topgrade-rs/topgrade/releases/download/v${pkgver}/topgrade-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
pkgdesc="Upgrades everything on your system"
breaks=("${gives}" "${gives}-deb" "${gives}-app" "${gives}-git" "${gives}-musl-bin")
repology=("project: ${gives}")
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
