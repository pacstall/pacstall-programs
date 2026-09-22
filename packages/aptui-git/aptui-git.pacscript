pkgname="aptui-git"
provides=("aptui")
pkgdesc="TUI package manager for APT-based Linux distributions"
url='https://github.com/mexirica/aptui'
maintainer=("CiccioBro17 <203853964+CiccioBro17@users.noreply.github.com>")
pkgver="0.8.2"
arch=("any")
source=("git+https://github.com/mexirica/aptui.git")
external_connection=true
_min_golang='1.26'
makedepends=(
  "golang-${_min_golang}"
)

build() {
  cd "${srcdir}/aptui"
  export PATH="/usr/lib/go-${_min_golang}/bin:${PATH}"
  go build -o aptui .
}

package() {
  cd "${srcdir}/aptui"
  install -Dm755 aptui "${pkgdir}/usr/bin/aptui"
}
