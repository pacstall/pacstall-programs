pkgname='kakoune-lsp'
pkgver='18.2.0'
pkgdesc='Kakoune Language Server Protocol Client'
license=('Unlicense' 'MIT')
repology=('project: kak-lsp')
url='https://lists.sr.ht/~krobelus/kakoune'
arch=("amd64" "arm64" "armhf" "i386")
maintainer=("Erik Hedlund <erikcghedlund@outlook.com>")
source=("https://github.com/${pkgname}/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("4823bb733dc3d1e1119af60873b73a62d71d305573abc7d0b016c9077c99913e")
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
