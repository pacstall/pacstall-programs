pkgname="kwin-krohnkite-git"
gives="kwin-krohnkite"
pkgdesc="Dynamic tiling extension for KWin 6 inspired by dwm"
pkgver='0.9.9.2'
repology=('project: kwin-scripts-krohnkite')
arch=('all')
breaks=("${gives}")
url='https://github.com/anametologin/krohnkite'
source=("${pkgname}::https://github.com/anametologin/krohnkite.git")
sha256sums=('SKIP')
license=('MIT')
maintainer=('Erik Hedlund <erikcghedlund@outlook.com>')
depends=('kwin-common>=4:6.0.0')
makedepends=('npm')
external_connection=true

prepare() {
  cd "${srcdir}/${pkgname}"
  npm install --save-dev
  sed -i "s/\$VER/${pkgver}/" "./res/metadata.json"
  sed -i "s/\$REV/${git_pkgver}/" "./res/metadata.json"
}

build() {
  cd "${srcdir}/${pkgname}"
  npm run tsc
}

package() {
  cd "${srcdir}/${pkgname}"
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
