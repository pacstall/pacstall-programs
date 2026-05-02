pkgname="meowdo"
pkgver="1.3.5"
pkgdesc="Cute, keyboard-driven todo list with a cat sidekick for your terminal"
arch=('amd64' 'arm64')
url='https://github.com/Sycorlax/Meowdo'
source=("https://github.com/Sycorlax/Meowdo/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')
depends=("libncurses6")
makedepends=("gcc" "make" "libncurses-dev")
maintainer=("Sycorlax <mehdidiuori2002@gmail.com>")
license=('GPL-3.0-only')

build() {
  cd "${pkgname^}-${pkgver}"
  make -j"${NCPU}"
}

package() {
  cd "${pkgname^}-${pkgver}"
  install -Dm755 "meowdo" -t "${pkgdir}/usr/bin"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
