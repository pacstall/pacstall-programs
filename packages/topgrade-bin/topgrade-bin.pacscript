name="topgrade-bin"
pkgname="topgrade"
version="10.3.3"
url="https://github.com/topgrade-rs/topgrade/releases/download/v${version}/topgrade-v${version}-x86_64-unknown-linux-gnu.tar.gz"
description="Upgrades everything on your system"
hash="65c1a4f278f25b005baa20a0ddd17a97d83ba6fb1044ab58f88eb6473d513e8b"
breaks=("${pkgname}" "${pkgname}-deb" "${pkgname}-app" "${pkgname}-git" "${pkgname}-musl-bin")
gives="${pkgname}"
repology=("project: ${pkgname}")
arch=('amd64')
maintainer="charitarthchugh <37895518+charitarthchugh@users.noreply.github.com>"

install() {
  sudo install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin"
}
