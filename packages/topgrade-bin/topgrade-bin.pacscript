name="topgrade-bin"
pkgname="topgrade"
version="10.0.1"
url="https://github.com/topgrade-rs/topgrade/releases/download/v${version}/topgrade-${version}-x86_64-linux-gnu.tar.gz"
description="Upgrades everything on your system"
hash="2802077ef38e7a396bf96195ec9c5cc842cfe8c02a3e6b4aa36a47f45255f97a"
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
