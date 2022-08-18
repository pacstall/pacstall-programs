name="starship-bin"
pkgname="starship"
version="1.10.1"
gives="${pkgname}"
url="https://github.com/starship/starship/releases/download/v${version}/starship-x86_64-unknown-linux-gnu.tar.gz"
description="The minimal, blazing-fast, and infinitely customizable prompt for any shell"
hash="ab2d62a41e9eeef06b5f0c935782410643d5f691f64c930b397494b2f4aabd5e"
breaks="${pkgname} ${pkgname}-deb ${pkgname}-app ${pkgname}-git"
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
