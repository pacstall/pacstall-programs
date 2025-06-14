pkgname="kwin-krohnkite"
pkgdesc="Dynamic tiling extension for KWin 6 inspired by dwm"
pkgver="0.9.9.1"
_pkgrev="879810a"
gives="kwin-krohnkite"
repology=("project: kwin-scripts-krohnkite")
arch=("all")
breaks=("${gives}-git")
url='https://github.com/anametologin/krohnkite'
source=("https://github.com/anametologin/krohnkite/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("003f91d7a5ad0fdb1587144ab3d0a256c32c902e798ca1ee23d3cfb2123682a0")
license=("MIT")
maintainer=("Erik Hedlund <erikcghedlund@outlook.com>")
depends=("kwin-common>=4:6.0.0")
makedepends=("node-typescript")
compatible=("ubuntu:devel" "ubuntu:questing" "ubuntu:plucky" "ubuntu:oracular" "debian:trixie" "debian:sid")

prepare() {
  cd "${srcdir}/krohnkite-${pkgver}"
  sed -i "s/\$VER/${pkgver}/" "./res/metadata.json"
  sed -i "s/\$REV/${_pkgrev}/" "./res/metadata.json"
}

build() {
  cd "${srcdir}/krohnkite-${pkgver}"
  tsc
}

package() {
  cd "${srcdir}/krohnkite-${pkgver}"
  destdir="${pkgdir}/usr/local/share/kwin/scripts/krohnkite"
  install -Dm644 "./res/metadata.json" "${destdir}/metadata.json"
  install -Dm644 "./res/shortcuts.qml" "${destdir}/contents/ui/shortcuts.qml"
  install -Dm644 "./res/popup.qml" "${destdir}/contents/ui/popup.qml"
  install -Dm644 "./res/main.qml" "${destdir}/contents/ui/main.qml"
  install -Dm644 "./res/config.ui" "${destdir}/contents/ui/config.ui"
  install -Dm644 "./res/config.xml" "${destdir}/contents/config/config.xml"
  install -Dm644 "./res/main.js" "${destdir}/contents/code/main.js"
  install -Dm644 "./krohnkite.js" "${destdir}/contents/code/script.js"
}
