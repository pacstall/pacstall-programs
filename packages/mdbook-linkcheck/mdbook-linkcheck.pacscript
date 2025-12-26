pkgname='mdbook-linkcheck'
arch=("any")
pkgver='0.7.7'
pkgdesc='A backend for mdbook which will check your links for you'
url='https://www.michaelfbryan.com/mdbook-linkcheck/mdbook_linkcheck/index.html'
makedepends=('cargo')
pacdeps=('mdbook')
repology=("project: ${pkgname}")
source=("https://github.com/Michael-F-Bryan/mdbook-linkcheck/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3194243acf12383bd328a9440ab1ae304e9ba244d3bd7f85f1c23b0745c4847a')
external_connection='true'

prepare() {
  cd "${pkgname}-${pkgver}"
  CARGO_HOME=crates cargo fetch --locked
}

build() {
  cd "${pkgname}-${pkgver}"
  CARGO_HOME=crates cargo build --release --offline --all-features
}

check() {
  cd "${pkgname}-${pkgver}"
  CARGO_HOME=crates cargo test --all-features
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
