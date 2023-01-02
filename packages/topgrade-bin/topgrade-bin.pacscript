name="topgrade-bin"
pkgname="topgrade"
version="10.2.4"
url="https://github.com/topgrade-rs/topgrade/releases/download/v${version}/topgrade-v${version}-x86_64-unknown-linux-gnu.tar.gz"
description="Upgrades everything on your system"
hash="4a20987ad08424f3cf4d57bc3ff4844a4a32612385a98dafa226cd3730274273"
breaks="${pkgname} ${pkgname}-deb ${pkgname}-app ${pkgname}-git ${pkgname}-musl-bin"
gives="${pkgname}"
repology=("project: ${pkgname}")
maintainer="charitarthchugh <37895518+charitarthchugh@users.noreply.github.com>"
prepare() {
  true
}

build() {
  true
}

install() {
  sudo install -Dm755 "${pkgname}" -t "${STOWDIR}/${name}/usr/bin"
}
