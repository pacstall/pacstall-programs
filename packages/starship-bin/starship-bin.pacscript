name="starship-bin"
pkgname="starship"
version="1.13.1"
gives="${pkgname}"
url="https://github.com/starship/starship/releases/download/v${version}/starship-x86_64-unknown-linux-gnu.tar.gz"
description="The minimal, blazing-fast, and infinitely customizable prompt for any shell"
hash="a1ae62be4aeefbbf72f29b771691a40758a8ae808863f3cb40611bdfe3061a5b"
arch=('amd64')
breaks="${pkgname} ${pkgname}-deb ${pkgname}-app ${pkgname}-git"
repology=("project: ${pkgname}")
maintainer="charitarthchugh <37895518+charitarthchugh@users.noreply.github.com>"

install() {
  sudo install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin"
}
