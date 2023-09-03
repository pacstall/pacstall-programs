name="topgrade-musl-bin"
pkgname="topgrade"
pkgver="12.0.2"
url="https://github.com/topgrade-rs/topgrade/releases/download/v${pkgver}/topgrade-v${pkgver}-x86_64-unknown-linux-musl.tar.gz"
pkgdesc="Upgrades everything on your system"
hash="111b64dfd97fb77ace2d067a0a83ea5ebbdf0cf8c92681fa8bffcdc1e53c78cb"
arch=('amd64')
breaks=("${pkgname}" "${pkgname}-deb" "${pkgname}-app" "${pkgname}-git" "${pkgname}-bin")
gives="${pkgname}"
repology=("project: ${pkgname}")
maintainer="Oren Klopfer <oren@taumoda.com>"

package() {
  sudo install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin"
}
