name="starship-bin"
pkgname="starship"
pkgver="1.15.0"
gives="${pkgname}"
url="https://github.com/starship/starship/releases/download/v${pkgver}/starship-x86_64-unknown-linux-gnu.tar.gz"
pkgdesc="The minimal, blazing-fast, and infinitely customizable prompt for any shell"
hash="d7269514fa450678790f37d41c691e4a80492b127b861e30e252a6646040b615"
arch=('amd64')
breaks=("${pkgname}" "${pkgname}-deb" "${pkgname}-app" "${pkgname}-git")
repology=("project: ${pkgname}")
maintainer="charitarthchugh <37895518+charitarthchugh@users.noreply.github.com>"

package() {
  sudo install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin"
}
