pkgname="freshfetch-git"
gives="freshfetch"
pkgdesc="A fresh take on Neofetch"
arch=('amd64')
url='https://github.com/K4rakara/freshfetch'
source=("https://github.com/K4rakara/freshfetch.git")
maintainer=("pythoncrazy <pinakpaliwal07@gmail.com>")
pkgver="0.2.0"
makedepends=('cargo')
external_connection="true"

build() {
  cd "${gives}"
  cargo build --locked --release -vv
}

package() {
  cd "${gives}"
  install -Dm0755 -t "${pkgdir}/usr/bin" "target/release/freshfetch"
}
