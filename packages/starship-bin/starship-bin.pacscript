pkgname="starship-bin"
gives="starship"
pkgver="1.24.2"
source=("https://github.com/starship/starship/releases/download/v${pkgver}/starship-x86_64-unknown-linux-gnu.tar.gz")
pkgdesc="The minimal, blazing-fast, and infinitely customizable prompt for any shell"
sha256sums=("3f12f61883ff324c1dbe7b885fa125d5490960e5cad6a12eeaa34695ec1b5744")
arch=('amd64')
breaks=("${gives}" "${gives}-deb" "${gives}-app" "${gives}-git")
repology=("project: ${gives}")
maintainer=("charitarthchugh <37895518+charitarthchugh@users.noreply.github.com>")

package() {
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
