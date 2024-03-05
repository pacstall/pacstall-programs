name="cheat"
gives="cheat"
repology=("project: cheat")
pkgver="4.4.0"
replaces=("${gives}")
breaks=("${gives}" "${gives}-bin" "${gives}-git" "${gives}-app" "${gives}-deb")
arch=('amd64')
hash=("f975e6df9b1226a4405e727b3222a0d6a58f2237cc449e12588d8df5eb713a59")
source=("https://github.com/cheat/cheat/releases/download/${pkgver}/cheat-linux-amd64.gz")
homepage="https://github.com/cheat/cheat"
pkgdesc="Create and view interactive cheatsheets on the command-line"
maintainer="Arrowsome <ramtintoosi@gmail.com>"

package() {
  gzip -d cheat-linux-amd64.gz
  sudo install -Dm755 cheat-linux-amd64 "${pkgdir}/usr/bin/${name}"
}
