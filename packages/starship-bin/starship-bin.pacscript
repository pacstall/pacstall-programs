pkgname="starship-bin"
gives="starship"
pkgver="1.16.0"
source=("https://github.com/starship/starship/releases/download/v${pkgver}/starship-x86_64-unknown-linux-gnu.tar.gz")
pkgdesc="The minimal, blazing-fast, and infinitely customizable prompt for any shell"
sha256sums=("bb797f4af36138581cb43d36f432d54312360da21dff4c38545675c7873758ae")
arch=('amd64')
breaks=("${gives}" "${gives}-deb" "${gives}-app" "${gives}-git")
repology=("project: ${gives}")
maintainer=("charitarthchugh <37895518+charitarthchugh@users.noreply.github.com>")

package() {
  cd "${_archive}"
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
