pkgname='kakoune-lsp'
pkgver='21.0.1'
pkgdesc='Kakoune Language Server Protocol Client'
license=('Unlicense' 'MIT')
repology=('project: kak-lsp')
url='https://lists.sr.ht/~krobelus/kakoune'
arch=("amd64" "arm64" "armhf" "i386")
maintainer=("Erik Hedlund <erikcghedlund@outlook.com>")
source=("https://github.com/${pkgname}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("2b56a1084b5dacfaab9dad50e6ae7b0b94470d5a9c0718700a949162fa04ae4b")
_min_cargo='1.81'
makedepends=("cargo-${_min_cargo} | cargo>=${_min_cargo} | rustup" 'make')
enhances=('kakoune')
external_connection=true

build() {
  export PATH="/usr/lib/rust-${_min_cargo}/bin:${PATH}"
  make -C "${pkgname}-${pkgver}" build
}

check() {
  cd "${pkgname}-${pkgver}"
  export PATH="/usr/lib/rust-${_min_cargo}/bin:${PATH}"
  cargo test
}

package() {
  export PATH="/usr/lib/rust-${_min_cargo}/bin:${PATH}"
  make -C "${pkgname}-${pkgver}" DESTDIR="${pkgdir}" PREFIX="/usr/local" install
}
