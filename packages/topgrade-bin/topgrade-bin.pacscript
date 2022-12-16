name="topgrade-bin"
pkgname="topgrade"
version="10.2.2"
url="https://github.com/topgrade-rs/topgrade/releases/download/v${version}/topgrade-v${version}-x86_64-unknown-linux-gnu.tar.gz"
description="Upgrades everything on your system"
hash="2ee41f06699717ff3d4cb44617ce19c8c25d3c3da3feb5454858cc9d7051235b"
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
