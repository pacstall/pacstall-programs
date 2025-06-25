pkgname="pkgz"
arch=("amd64")
pkgver="0.1.4"
source=("@${pkgname}~${pkgver}::https://github.com/roguehashrate/pkgz/archive/refs/tags/v${pkgver}.tar.gz")
pkgdesc="Fast, extensible CLI package manager written in Crystal"
maintainer=("RogueHashrate <roguehashrate@gmail.com>")
sha256sums=("39305d5cb1725006de5006d8d76209087a8c49a7cfc8912497c61f62e535508d")
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
