pkgname="starship-bin"
gives="starship"
pkgver="1.26.0"
source=("https://github.com/starship/starship/releases/download/v${pkgver}/starship-x86_64-unknown-linux-gnu.tar.gz")
pkgdesc="The minimal, blazing-fast, and infinitely customizable prompt for any shell"
sha256sums=("321f0dd7af8340a5f2e6a8fec6538a04f617486f9ec70d878f91c09cd8deef22")
arch=('amd64')
breaks=("${gives}" "${gives}-deb" "${gives}-app" "${gives}-git")
repology=("project: ${gives}")
maintainer=("charitarthchugh <37895518+charitarthchugh@users.noreply.github.com>")

package() {
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
