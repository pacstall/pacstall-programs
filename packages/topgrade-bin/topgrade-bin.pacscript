name="topgrade-bin"
pkgname="topgrade"
version="9.1.0"
url="https://github.com/topgrade-rs/topgrade/releases/download/v${version}/topgrade-rs"
description="Upgrades everything on your system"
hash="9eb2c499d5028d373989df487aaf5b6bfb2d419c5736018cd45a85ad3aa43518"
breaks="${pkgname} ${pkgname}-deb ${pkgname}-app ${pkgname}-git"
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
  mv "${pkgname}-rs" "${pkgname}"
  sudo install -Dm755 "${pkgname}" -t "${STOWDIR}/${name}/usr/bin"
}
