pkgname="kwin-krohnkite"
pkgdesc="Dynamic tiling extension for KWin 6 inspired by dwm"
pkgver="0.9.9.1"
gives="kwin-krohnkite"
repology=("project: kwin-scripts-krohnkite")
arch=("all")
breaks=("${gives}-git")
url='https://github.com/anametologin/krohnkite'
source=("https://github.com/anametologin/krohnkite/releases/download/${pkgver}/krohnkite.kwinscript")
sha256sums=("ba07fcd802476554325d0150398fa5c76e94ea074446dd9954729ce074edf361")
license=("MIT")
maintainer=("Erik Hedlund <erikcghedlund@outlook.com>")
depends=("kwin-common>=4:6.0.0")
makedepends=("kwin-common>=4:6.0.0")
compatible=("ubuntu:questing" "ubuntu:plucky" "ubuntu:oracular" "debian:trixie" "debian:sid")

package() {
  kpackagetool6 --packageroot "${pkgdir}/usr/local/share/kwin/scripts" --type "KWin/Script" --install "${srcdir}/krohnkite.kwinscript"
}
