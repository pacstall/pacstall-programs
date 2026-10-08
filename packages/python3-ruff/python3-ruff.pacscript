pkgname='python3-ruff'
pkgver='0.16.10'
pkgdesc='Fast Python linter and code formatter, written in Rust'
license=('MIT')
repology=('project: python:ruff')
url='https://github.com/astral-sh/ruff'
arch=('any')
maintainer=('Erik Hedlund <erikcghedlund@outlook.com>')
source=("https://github.com/astral-sh/ruff/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c8ea3637edc68ac9d17c9143a2a432540370e3768a220b9978e931e5f89d6260')
_min_cargo='1.97'
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
