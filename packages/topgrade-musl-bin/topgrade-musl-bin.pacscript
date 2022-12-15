name="topgrade-musl-bin"
pkgname="topgrade"
version="10.2.2"
url="https://github.com/topgrade-rs/topgrade/releases/download/v${version}/topgrade-v${version}-x86_64-unknown-linux-musl.tar.gz"
description="Upgrades everything on your system"
hash="7ad20d8475671b25f8f22ff2c5169a85f4557b114c616f5997e60860f400af7c"
breaks="${pkgname} ${pkgname}-deb ${pkgname}-app ${pkgname}-git ${pkgname}-bin"
gives="${pkgname}"
repology=("project: ${pkgname}")
maintainer="charitarthchugh <37895518+charitarthchugh@users.noreply.github.com>"

install() {
  sudo install -Dm755 "${pkgname}" -t "${STOWDIR}/${name}/usr/bin"
}
