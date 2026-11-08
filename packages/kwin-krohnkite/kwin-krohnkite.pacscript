pkgname="kwin-krohnkite"
pkgdesc="Dynamic tiling extension for KWin 6 inspired by dwm"
pkgver="0.9.11.0"
repology=("project: kwin-scripts-krohnkite")
arch=("all")
breaks=("${pkgname}-git")
url='https://codeberg.org/anametologin/Krohnkite'
source=("https://codeberg.org/anametologin/Krohnkite/releases/download/${pkgver}/krohnkite.kwinscript")
sha256sums=("1a8d99bf55dbf30d3af704ba7951a895aeee1d16e7da5a7bfe1d2db8215f6fa7")
license=("MIT")
maintainer=("Erik Hedlund <erikcghedlund@outlook.com>")
depends=("kwin-common>=4:6.0.0")
makedepends=("kwin-common>=4:6.0.0")

package() {
  kpackagetool6 --packageroot "${pkgdir}/usr/local/share/kwin/scripts" --type "KWin/Script" --install "${srcdir}/krohnkite.kwinscript"
}
