name="topgrade-musl-bin"
pkgname="topgrade"
pkgver="14.0.0"
url="https://github.com/topgrade-rs/topgrade/releases/download/v${pkgver}/topgrade-v${pkgver}-x86_64-unknown-linux-musl.tar.gz"
pkgdesc="Upgrades everything on your system"
hash="f9fc5378ef86dc40efbd0e40a7b62b8e1470ce4f00c0ea101f512520d3bfe797"
arch=('amd64')
breaks=("${pkgname}" "${pkgname}-deb" "${pkgname}-app" "${pkgname}-git" "${pkgname}-bin")
gives="${pkgname}"
repology=("project: ${pkgname}")
maintainer="Oren Klopfer <oren@taumoda.com>"

package() {
  sudo install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin"
}
