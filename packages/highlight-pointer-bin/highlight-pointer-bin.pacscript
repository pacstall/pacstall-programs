maintainer=("0x262D <pacstall@copypaste.anonaddy.me>")
pkgname="highlight-pointer-bin"
gives="highlight-pointer"
arch=("amd64")
pkgver="1.2"
pkgdesc="Highlight mouse pointer/cursor using a colored dot"
source=("https://github.com/swillner/${gives}/releases/download/v${pkgver}/${gives}")
sha256sums=("a9bdd13c6e6edd79d6639537104681b10aae6d1238466cbf486495fc95ebc93d")
breaks=("${gives}" "${gives}-deb" "${gives}-git")
repology=("project: ${gives}")

package() {
  cd "${srcdir}"
  # Install bin
  install -Dm755 "highlight-pointer" "${pkgdir}/usr/bin/${gives}"
}
# vim:set ft=sh ts=2 sw=2 et:
