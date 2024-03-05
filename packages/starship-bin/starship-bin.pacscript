name="starship-bin"
pkgname="starship"
pkgver="1.16.0"
gives="${pkgname}"
source=("https://github.com/starship/starship/releases/download/v${pkgver}/starship-x86_64-unknown-linux-gnu.tar.gz")
pkgdesc="The minimal, blazing-fast, and infinitely customizable prompt for any shell"
hash=("bb797f4af36138581cb43d36f432d54312360da21dff4c38545675c7873758ae")
arch=('amd64')
breaks=("${pkgname}" "${pkgname}-deb" "${pkgname}-app" "${pkgname}-git")
repology=("project: ${pkgname}")
maintainer="charitarthchugh <37895518+charitarthchugh@users.noreply.github.com>"

package() {
  sudo install -Dm755 "${pkgname}" -t "${pkgdir}/usr/bin"
}
