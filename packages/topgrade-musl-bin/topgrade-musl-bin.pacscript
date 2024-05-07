pkgname="topgrade-musl-bin"
gives="topgrade"
pkgver="14.0.1"
source=("https://github.com/topgrade-rs/topgrade/releases/download/v${pkgver}/topgrade-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
pkgdesc="Upgrades everything on your system"
sha256sums=("bb656d9a04bddd0e2e8bca73529d6b2c7872a0b5f92bfdfb5ed27f91cc3a29cb")
arch=('amd64')
breaks=("${gives}" "${gives}-deb" "${gives}-app" "${gives}-git" "${gives}-bin")
repology=("project: ${gives}")
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${_archive}"
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
