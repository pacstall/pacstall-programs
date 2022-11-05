name="topgrade-bin"
pkgname="topgrade"
version="10.1.1"
url="https://github.com/topgrade-rs/topgrade/releases/download/v${version}/topgrade-v${version}-x86_64-unknown-linux-gnu.tar.gz"
description="Upgrades everything on your system"
hash="c07b4d2b3ebbe59cbfc12a4bc6ca7f283fcbc80cd56b44ee741b0f4eb94d4143"
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
