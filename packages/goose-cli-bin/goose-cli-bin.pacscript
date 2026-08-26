pkgname="goose-cli-bin"
gives="goose"
repology=("project: ${gives}")
pkgver="1.47.0"
pkgdesc="Your native open source AI agent"
url='https://goose-docs.ai'
arch=('x86_64' 'aarch64')
source_x86_64=("https://github.com/aaif-goose/goose/releases/download/v${pkgver}/goose-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/aaif-goose/goose/releases/download/v${pkgver}/goose-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=("446e014bd0412fcedbeb2dee845d6d5bfcad630944b01280fb35f6e4feb1112a")
sha256sums_aarch64=("d51c19d0eb7d97c1916d39a5ae01af2cf8a27665165b5082190ab76de64914d1")
maintainer=("aKqir24 <aKqir24@github.com>")

package() {
  cd "${srcdir}"
  install -Dm755 "goose" -t "${pkgdir}/usr/bin"
}
