pkgname="topgrade-musl-bin"
gives="topgrade"
pkgver="16.0.4"
source=("https://github.com/topgrade-rs/topgrade/releases/download/v${pkgver}/topgrade-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
pkgdesc="Upgrades everything on your system"
sha256sums=("3fd73ff55571f2a979679cb215c966bceb961a6ae6678f8eb2ac3140dd7d41bd")
arch=('amd64')
breaks=("${gives}" "${gives}-deb" "${gives}-app" "${gives}-git" "${gives}-bin")
repology=("project: ${gives}")
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
