pkgname="pkgz"
arch=("all")
pkgver="0.1.2"
source=("@${pkgname}~${pkgver}::https://github.com/roguehashrate/pkgz/archive/refs/tags/v${pkgver}.tar.gz")
pkgdesc="Fast, extensible CLI package manager written in Crystal"
maintainer=("Your Name <youremail@example.com>")
sha256sums=("e1ea57ac0bfa56c67d49d31f79179d5da5a5ed47e5ebcc136a06585ba39277bb")
makedepends=("crystal" "gzip" "tar")
external_connection=true

build() {

  cd "${pkgname}~${pkgver}"
  shards install
  shards build --release
}

package() {
  cd "${pkgname}~${pkgver}"
  install -Dm755 "bin/pkgz" -t "${pkgdir}/usr/bin"
}
