pkgname="topgrade-musl-bin"
gives="topgrade"
pkgver="14.0.0"
source=("https://github.com/topgrade-rs/topgrade/releases/download/v${pkgver}/topgrade-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
pkgdesc="Upgrades everything on your system"
sha256sums=("f9fc5378ef86dc40efbd0e40a7b62b8e1470ce4f00c0ea101f512520d3bfe797")
arch=('amd64')
breaks=("${gives}" "${gives}-deb" "${gives}-app" "${gives}-git" "${gives}-bin")
repology=("project: ${gives}")
maintainer=("Oren Klopfer <oren@taumoda.com>")

package() {
  cd "${_archive}"
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
