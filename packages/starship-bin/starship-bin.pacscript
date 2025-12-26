pkgname="starship-bin"
gives="starship"
pkgver="1.23.0"
source=("https://github.com/starship/starship/releases/download/v${pkgver}/starship-x86_64-unknown-linux-gnu.tar.gz")
pkgdesc="The minimal, blazing-fast, and infinitely customizable prompt for any shell"
sha256sums=("cef41df04378c6f692913c5d9c1032d3b9a4369a1d2f3296c8300ed8838c2197")
arch=('amd64')
breaks=("${gives}" "${gives}-deb" "${gives}-app" "${gives}-git")
repology=("project: ${gives}")
maintainer=("charitarthchugh <37895518+charitarthchugh@users.noreply.github.com>")

package() {
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin"
}
