name="topgrade-musl-bin"
pkgname="topgrade"
version="10.3.3"
url="https://github.com/topgrade-rs/topgrade/releases/download/v${version}/topgrade-v${version}-x86_64-unknown-linux-musl.tar.gz"
description="Upgrades everything on your system"
hash="09844a967ea34e90a4c8d95a27cb70af09bc79d6148cf288790bed096b1b00e7"
arch=('amd64')
breaks=("${pkgname}" "${pkgname}-deb" "${pkgname}-app" "${pkgname}-git" "${pkgname}-bin")
gives="${pkgname}"
repology=("project: ${pkgname}")

install() {
  sudo install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin"
}
