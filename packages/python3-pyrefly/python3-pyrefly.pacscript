pkgname='python3-pyrefly'
pkgver='1.3.0'
pkgdesc='Fast type checker and language server for Python'
license=('MIT')
repology=('project: python:pyrefly')
url='https://pyrefly.org/'
arch=('any')
maintainer=('Erik Hedlund <erikcghedlund@outlook.com>')
source=("https://github.com/facebook/pyrefly/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f26552aae8957d6924319034eadd69830f2442685fc4e696c97e777c827a4082')
_min_cargo='1.97'
makedepends=("cargo-${_min_cargo} | cargo>=${_min_cargo} | rustup")
external_connection=true

build() {
  cd "${srcdir}/pyrefly-${pkgver}"
  export PATH="/usr/lib/rust-${_min_cargo}/bin:${PATH}"
  cargo build -j"${NCPU}" --release --locked
}

package() {
  cd "${srcdir}/pyrefly-${pkgver}"
  install -Dm755 "target/release/pyrefly" "${pkgdir}/usr/bin/pyrefly"
  install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
