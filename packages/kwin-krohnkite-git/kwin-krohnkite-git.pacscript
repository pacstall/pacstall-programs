pkgname="kwin-krohnkite-git"
gives="kwin-krohnkite"
pkgdesc="Dynamic tiling extension for KWin 6 inspired by dwm"
pkgver='0.9.9.11'
repology=('project: kwin-scripts-krohnkite')
arch=('all')
breaks=("${gives}")
url='https://codeberg.org/anametologin/Krohnkite'
source=("${pkgname}::https://codeberg.org/anametologin/Krohnkite.git")
sha256sums=('SKIP')
license=('MIT')
maintainer=('Erik Hedlund <erikcghedlund@outlook.com>')
depends=('kwin-common>=4:6.0.0')
makedepends=('npm' '7zip')
external_connection=true

prepare() {
  if [[ -n $(command -v task) ]]; then
    ln -s "$(command -v task)" "${srcdir}/task"
  else
    # This is so that we can use 'task' as a makedepend if it is not already installed
    sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b "${srcdir}"
  fi
}

build() {
  "${srcdir}/task" --dir "${srcdir}/${pkgname}" package
}

package() {
  # 'kpackagetool6' was causing issues unless I first rename the file to not contain '~'
  mv "$(find "${srcdir}/${pkgname}/builds" -name 'krohnkite*.kwinscript')" "${srcdir}/krohnkite.kwinscript"
  kpackagetool6 --packageroot "${pkgdir}/usr/local/share/kwin/scripts" \
    --type "KWin/Script" \
    --install "${srcdir}/krohnkite.kwinscript"
}
