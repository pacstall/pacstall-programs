pkgname="topgrade-musl-bin"
gives="topgrade"
pkgver="16.0.1"
pkgrel="2"
source=("https://github.com/topgrade-rs/topgrade/releases/download/v${pkgver}/topgrade-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
pkgdesc="Upgrades everything on your system"
sha256sums=("61c9f61c4078f9b925e4f5eacbdf056b934c961d7279def368436b7a52f50b83")
arch=('amd64')
breaks=("${gives}" "${gives}-deb" "${gives}-app" "${gives}-git" "${gives}-bin")
repology=("project: ${gives}")
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
