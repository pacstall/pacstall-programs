pkgname='python3-pyrefly'
pkgver='1.3.1'
pkgdesc='Fast type checker and language server for Python'
license=('MIT')
repology=('project: python:pyrefly')
url='https://pyrefly.org/'
arch=('any')
maintainer=('Erik Hedlund <erikcghedlund@outlook.com>')
source=("https://github.com/facebook/pyrefly/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('00777ca516a4bd6740c2f5b2c70a5ead3349bb565e5f86ba8ae59810b5ea3f45')
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
