pkgname='python3-ruff'
pkgver='0.16.7'
pkgdesc='Fast Python linter and code formatter, written in Rust'
license=('MIT')
repology=('project: python:ruff')
url='https://github.com/astral-sh/ruff'
arch=('any')
maintainer=('Erik Hedlund <erikcghedlund@outlook.com>')
source=("https://github.com/astral-sh/ruff/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c3114db827dd947aa96603387318ea0099c65c6d88abb2704f9e63fc11407097')
_min_cargo='1.96'
makedepends=("cargo-${_min_cargo} | cargo>=${_min_cargo} | rustup")
external_connection=true

build() {
  cd "${srcdir}/ruff-${pkgver}"
  export PATH="/usr/lib/rust-${_min_cargo}/bin:${PATH}"
  cargo build -j"${NCPU}" --release --locked
}

package() {
  cd "${srcdir}/ruff-${pkgver}"
  install -Dm755 "target/release/ruff" "${pkgdir}/usr/bin/ruff"
  install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
