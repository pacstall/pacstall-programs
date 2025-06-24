pkgname="cheat"
gives="cheat"
repology=("project: cheat")
pkgver="4.4.2"
replaces=("${gives}")
breaks=("${gives}" "${gives}-bin" "${gives}-git" "${gives}-app" "${gives}-deb")
arch=('amd64')
sha256sums=("b81f5ba21f134087c0294d809f89e5442d641d7be297bb128807cbce00849e9b")
source=("https://github.com/cheat/cheat/releases/download/${pkgver}/cheat-linux-amd64.gz")
url='https://github.com/cheat/cheat'
pkgdesc="Create and view interactive cheatsheets on the command-line"
maintainer=("Arrowsome <ramtintoosi@gmail.com>")

package() {
  cd "${srcdir}"
  gzip -d cheat-linux-amd64.gz
  install -Dm755 cheat-linux-amd64 "${pkgdir}/usr/bin/${pkgname}"
}
