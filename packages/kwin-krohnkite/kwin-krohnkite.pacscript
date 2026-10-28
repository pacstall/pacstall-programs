pkgname="kwin-krohnkite"
pkgdesc="Dynamic tiling extension for KWin 6 inspired by dwm"
pkgver="0.9.10.0"
repology=("project: kwin-scripts-krohnkite")
arch=("all")
breaks=("${pkgname}-git")
url='https://codeberg.org/anametologin/Krohnkite'
source=("https://codeberg.org/anametologin/Krohnkite/releases/download/${pkgver}/krohnkite.kwinscript")
sha256sums=("7fe9b1af925061577004e8e46be17c014d081f06891779f1db72b9361dfcad40")
license=("MIT")
maintainer=("Erik Hedlund <erikcghedlund@outlook.com>")
depends=("kwin-common>=4:6.0.0")
makedepends=("kwin-common>=4:6.0.0")

package() {
  kpackagetool6 --packageroot "${pkgdir}/usr/local/share/kwin/scripts" --type "KWin/Script" --install "${srcdir}/krohnkite.kwinscript"
}
