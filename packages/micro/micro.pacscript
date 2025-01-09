pkgname="micro"
arch=("amd64")
pkgver="2.0.13"
pkgdesc="A modern and intuitive terminal-based text editor"
maintainer=("edward-riley <edward@edwardriley.co.uk>")
source=("@${pkgname}~${pkgver}::https://github.com/zyedidia/micro/releases/download/v${pkgver}/micro-${pkgver}-linux64.tar.gz")
replaces=("micro")
sha256sums=("a50e405d3d09d58f6b2c182429c18537a05f317dc0c3c9cb834b3271362e4781")
optdepends=("xclip: system clipboard support (X11)"
  "wl-clipboard: system clipboard support (Wayland)")
repology=("project: ${pkgname}")

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 micro "${pkgdir}/usr/bin/micro"
  tar -czf "micro.1.tar.gz" "micro.1"
  install -Dm644 micro.1.tar.gz "${pkgdir}/usr/share/man/man1/micro.1.tar.gz"
  install -Dm644 "./micro.svg" "${pkgdir}/usr/share/pixmaps/micro.svg"
  install -Dm644 micro.desktop "${pkgdir}/usr/share/applications/micro.desktop"
}
