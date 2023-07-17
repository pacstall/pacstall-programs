name="topgrade-bin"
pkgname="topgrade"
version="12.0.0"
url="https://github.com/topgrade-rs/topgrade/releases/download/v${version}/topgrade-v${version}-x86_64-unknown-linux-gnu.tar.gz"
description="Upgrades everything on your system"
hash="1c6743757d74ee6784e23b9ce3867b688601d87b3beb1e4faac9d4cac61e40a9"
breaks=("${pkgname}" "${pkgname}-deb" "${pkgname}-app" "${pkgname}-git" "${pkgname}-musl-bin")
gives="${pkgname}"
repology=("project: ${pkgname}")
arch=('amd64')
maintainer="charitarthchugh <37895518+charitarthchugh@users.noreply.github.com>"

package() {
  sudo install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin"
}
