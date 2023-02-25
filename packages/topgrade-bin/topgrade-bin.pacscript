name="topgrade-bin"
pkgname="topgrade"
version="10.3.1"
url="https://github.com/topgrade-rs/topgrade/releases/download/v${version}/topgrade-v${version}-x86_64-unknown-linux-gnu.tar.gz"
description="Upgrades everything on your system"
hash="d10d4cd5f11215a02101dba0bcc00eda43e9933c8a5e1699a9a835d888651ad3"
breaks="${pkgname} ${pkgname}-deb ${pkgname}-app ${pkgname}-git ${pkgname}-musl-bin"
gives="${pkgname}"
repology=("project: ${pkgname}")
maintainer="charitarthchugh <37895518+charitarthchugh@users.noreply.github.com>"

install() {
  sudo install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin"
}
