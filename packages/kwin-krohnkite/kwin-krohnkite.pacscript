pkgname="kwin-krohnkite"
pkgdesc="Dynamic tiling extension for KWin 6 inspired by dwm"
pkgver="0.9.9.2"
gives="kwin-krohnkite"
repology=("project: kwin-scripts-krohnkite")
arch=("all")
breaks=("${gives}-git")
url='https://github.com/anametologin/krohnkite'
source=("https://github.com/anametologin/krohnkite/releases/download/${pkgver}/krohnkite.kwinscript")
sha256sums=("42f7f66531d366c74b5fc860381da3517ccb4cdccd1f80c122fcab6e9a8fcf7e")
license=("MIT")
maintainer=("Erik Hedlund <erikcghedlund@outlook.com>")
depends=("kwin-common>=4:6.0.0")
makedepends=("kwin-common>=4:6.0.0")
compatible=("ubuntu:devel" "ubuntu:questing" "ubuntu:plucky" "ubuntu:oracular" "debian:trixie" "debian:sid")

package() {
  kpackagetool6 --packageroot "${pkgdir}/usr/local/share/kwin/scripts" --type "KWin/Script" --install "${srcdir}/krohnkite.kwinscript"
}
