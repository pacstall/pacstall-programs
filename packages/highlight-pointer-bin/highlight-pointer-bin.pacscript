maintainer=("0x262D <pacstall@copypaste.anonaddy.me>")
pkgname="highlight-pointer-bin"
gives="highlight-pointer"
arch=("amd64")
pkgver="1.1.3"
pkgdesc="Highlight mouse pointer/cursor using a colored dot"
source=("https://github.com/swillner/${gives}/releases/download/v${pkgver}/${gives}")
sha256sums=("82ad3845ef9ec3626ab1c0fad67614d5c61b26a2bf4e96b669e2a78e0395cb62")
breaks=("${gives}" "${gives}-deb" "${gives}-git")
repology=("project: ${gives}")

package() {
  cd "${srcdir}"
  # Install bin
  install -Dm755 "highlight-pointer" "${pkgdir}/usr/bin/${gives}"
}
# vim:set ft=sh ts=2 sw=2 et:
