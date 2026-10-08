maintainer=("IMY <omranmansour096@gmail.com>")
pkgname='vetro-git'
gives='vetro'
pkgver="1.0.0"
pkgdesc='Declarative GTK4 UI transpiler'
url='https://sinty.dev/'
license=('GPL-3.0')
arch=('amd64')
external_connection=true
source=("https://github.com/singularityos-lab/${gives}.git")
makedepends=(
  'golang-go>=1.24'
  'gir1.2-gtk-4.0'
)

build() {
  cd "${gives}"
  go build -o vetro .
}

package() {
  cd "${gives}"
  install -Dm755 "${gives}" -t "${pkgdir}/usr/bin/"
}
