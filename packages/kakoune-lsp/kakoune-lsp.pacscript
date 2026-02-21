pkgname='kakoune-lsp'
pkgver='19.0.1'
pkgdesc='Kakoune Language Server Protocol Client'
license=('Unlicense' 'MIT')
repology=('project: kak-lsp')
url='https://lists.sr.ht/~krobelus/kakoune'
arch=("amd64" "arm64" "armhf" "i386")
maintainer=("Erik Hedlund <erikcghedlund@outlook.com>")
source=("https://github.com/${pkgname}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("53cc4a4feb6ba6cc737a6bc2f4a3c7c11967acd02af8137a25c6f7db039ee559")
_min_cargo='1.81'
makedepends=("cargo-${_min_cargo} | cargo>=${_min_cargo}" 'make')
enhances=('kakoune')
external_connection=true

prepare() {
  if type "cargo-${_min_cargo}"; then
    sed -i "s/cargo/cargo-${_min_cargo}/g" "${srcdir}/${pkgname}-${pkgver}/Makefile"
  fi
}

build() {
  make -C "${pkgname}-${pkgver}" build
}

check() {
  cd "${pkgname}-${pkgver}"
  if type "cargo-${_min_cargo}"; then
    sh -c "cargo-${_min_cargo} test"
  else
    cargo test
  fi
}

package() {
  make -C "${pkgname}-${pkgver}" DESTDIR="${pkgdir}" PREFIX="/usr/local" install
}
