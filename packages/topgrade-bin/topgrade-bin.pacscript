name="topgrade-bin"
pkgname="topgrade"
version="10.0.0"
url="https://github.com/topgrade-rs/topgrade/releases/download/v${version}/topgrade-${version}-x86_64-linux-gnu.tar.gz"
description="Upgrades everything on your system"
hash="96a7ae2406460be5b9ab477a7df7804ae274328c0b082b3c693907e65ae6df25"
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
