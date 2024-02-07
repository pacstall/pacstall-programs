maintainer="0x262D <pacstall@copypaste.anonaddy.me>"
name="highlight-pointer-bin"
pkgname="highlight-pointer"
gives="highlight-pointer"
pkgver="1.1.3"
pkgdesc="Highlight mouse pointer/cursor using a colored dot"
url="https://github.com/swillner/${pkgname}/releases/download/v${pkgver}/${pkgname}"
hash="82ad3845ef9ec3626ab1c0fad67614d5c61b26a2bf4e96b669e2a78e0395cb62"
breaks=("${pkgname}" "${pkgname}-deb" "${pkgname}-git")
repology=("project: ${pkgname}")

package() {
  # Install bin
  sudo install -Dm755 "highlight-pointer" "${pkgdir}/usr/bin/${pkgname}"
}
