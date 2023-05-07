name="topgrade-musl-bin"
pkgname="topgrade"
version="11.0.2"
url="https://github.com/topgrade-rs/topgrade/releases/download/v${version}/topgrade-v${version}-x86_64-unknown-linux-musl.tar.gz"
description="Upgrades everything on your system"
hash="33a7cb1482aaf01ca798f747d29602624cc7a57edc62ca404e930d1a89cd6efc"
arch=('amd64')
breaks=("${pkgname}" "${pkgname}-deb" "${pkgname}-app" "${pkgname}-git" "${pkgname}-bin")
gives="${pkgname}"
repology=("project: ${pkgname}")

install() {
  sudo install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin"
}
