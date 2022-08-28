maintainer="0x262D <pacstall@copypaste.anonaddy.me>"
name="highlight-pointer-bin"
pkgname="highlight-pointer"
gives="highlight-pointer"
version="1.1.3"
description="Highlight mouse pointer/cursor using a colored dot"
url="https://github.com/swillner/${pkgname}/releases/download/v${version}/${pkgname}"
hash="82ad3845ef9ec3626ab1c0fad67614d5c61b26a2bf4e96b669e2a78e0395cb62"
breaks="${pkgname} ${pkgname}-deb ${pkgname}-git"
pkgdir="${STOWDIR}/${name}"
repology=("project: ${pkgname}")

prepare() {
  true
}

build() {
  true
}

install() {
  # Install bin
  sudo install -Dm755 "highlight-pointer" "${pkgdir}/usr/bin/${pkgname}"
}
# vim:set ft=sh ts=2 sw=2 et:
