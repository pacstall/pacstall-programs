pkgname="starship-bin"
gives="starship"
pkgver="1.19.0"
pkgrel="2"
source=("https://github.com/starship/starship/releases/download/v${pkgver}/starship-x86_64-unknown-linux-gnu.tar.gz")
pkgdesc="The minimal, blazing-fast, and infinitely customizable prompt for any shell"
sha256sums=("04710e277f7802ddf41400b650233a8954892bb9326768d82fff7d360ff37c58")
arch=('amd64')
breaks=("${gives}" "${gives}-deb" "${gives}-app" "${gives}-git")
repology=("project: ${gives}")
maintainer=("charitarthchugh <37895518+charitarthchugh@users.noreply.github.com>")

package() {
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
