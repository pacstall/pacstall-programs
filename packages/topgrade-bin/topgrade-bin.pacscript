name="topgrade-bin"
pkgname="topgrade"
version="9.0.1"
url="https://github.com/r-darwish/topgrade/releases/download/v${version}/topgrade-v${version}-x86_64-unknown-linux-gnu.tar.gz"
description="Upgrades everything on your system"
hash="f218bf49c64bad6e1cea33f191e849ba1f20309bfd59e7658412d32bd0626572"
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
  sudo install -Dm755 "${pkgname}" -t "${STOWDIR}/${name}/usr/bin"
}
