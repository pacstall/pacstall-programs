name="starship-bin"
pkgname="starship"
version="1.9.1"
gives="${pkgname}"
url="https://github.com/starship/starship/releases/download/v${version}/starship-x86_64-unknown-linux-gnu.tar.gz"
description="The minimal, blazing-fast, and infinitely customizable prompt for any shell"
hash="cd05b6390251128e723bbbcbf21099b975a43058fbe57721eb3597be9f089aca"
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
