pkgname="cheat"
gives="cheat"
repology=("project: cheat")
pkgver="5.1.0"
replaces=("${gives}")
breaks=("${gives}" "${gives}-bin" "${gives}-git" "${gives}-app" "${gives}-deb")
arch=('amd64')
sha256sums=("8c8405574d51d63ee89594bfed241f478d507d96af78e5c370dcbe65633d7b34")
source=("https://github.com/cheat/cheat/releases/download/${pkgver}/cheat-linux-amd64.gz")
url='https://github.com/cheat/cheat'
pkgdesc="Create and view interactive cheatsheets on the command-line"
maintainer=("Arrowsome <ramtintoosi@gmail.com>")

package() {
  cd "${srcdir}"
  gzip -d cheat-linux-amd64.gz
  install -Dm755 cheat-linux-amd64 "${pkgdir}/usr/bin/${pkgname}"
}
