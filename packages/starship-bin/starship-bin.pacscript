name="starship-bin"
pkgname="starship"
version="1.8.0"
gives="${pkgname}"
url="https://github.com/starship/starship/releases/download/v${version}/starship-x86_64-unknown-linux-gnu.tar.gz"
description="The minimal, blazing-fast, and infinitely customizable prompt for any shell"
hash="7124093ae00b24c7c074d9fb45a060ad909d75049d6b200714b3353116f864c5"
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
