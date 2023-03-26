name="starship-bin"
pkgname="starship"
version="1.12.0"
gives="${pkgname}"
url="https://github.com/starship/starship/releases/download/v${version}/starship-x86_64-unknown-linux-gnu.tar.gz"
description="The minimal, blazing-fast, and infinitely customizable prompt for any shell"
hash="23ff3916d7c13774e3539903cf991c22ae58e08f08847e438758c95191ad057f"
arch=('amd64')
breaks="${pkgname} ${pkgname}-deb ${pkgname}-app ${pkgname}-git"
repology=("project: ${pkgname}")
maintainer="charitarthchugh <37895518+charitarthchugh@users.noreply.github.com>"

install() {
  sudo install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin"
}
