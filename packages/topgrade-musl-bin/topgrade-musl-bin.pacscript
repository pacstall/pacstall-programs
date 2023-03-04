name="topgrade-musl-bin"
pkgname="topgrade"
version="10.2.4"
url="https://github.com/topgrade-rs/topgrade/releases/download/v${version}/topgrade-v${version}-x86_64-unknown-linux-musl.tar.gz"
description="Upgrades everything on your system"
hash="49233042fa7361078e00b6b39b59672017c82ea09008ef33a603442eb62142c6"
breaks="${pkgname} ${pkgname}-deb ${pkgname}-app ${pkgname}-git ${pkgname}-bin"
gives="${pkgname}"
repology=("project: ${pkgname}")

install() {
  sudo install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin"
}
