pkgname="topgrade-musl-bin"
gives="topgrade"
pkgver="16.0.3"
source=("https://github.com/topgrade-rs/topgrade/releases/download/v${pkgver}/topgrade-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
pkgdesc="Upgrades everything on your system"
sha256sums=("46eb516fe25069c34dbf2301f6c14ff40fd77ce6e23bdd3206e3f43b5e5a28de")
arch=('amd64')
breaks=("${gives}" "${gives}-deb" "${gives}-app" "${gives}-git" "${gives}-bin")
repology=("project: ${gives}")
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
