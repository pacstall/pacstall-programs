pkgname='python3-uv'
pkgver='0.13.4'
pkgdesc='Fast Python package and project manager, written in Rust'
license=('Apache-2.0' 'MIT')
repology=('project: python:uv')
url='https://github.com/astral-sh/uv'
arch=('any')
maintainer=('Erik Hedlund <erikcghedlund@outlook.com>')
source=("https://github.com/astral-sh/uv/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('182d66815490dbb497b456a6fde93c7e66ae7f27a50a2065b3b5a06fbb3a20bd')
_min_cargo='1.97'
makedepends=("cargo-${_min_cargo} | cargo>=${_min_cargo} | rustup")
external_connection=true

build() {
  cd "${srcdir}/uv-${pkgver}"
  export PATH="/usr/lib/rust-${_min_cargo}/bin:${PATH}"
  cargo build -j"${NCPU}" --release --locked
}

package() {
  cd "${srcdir}/uv-${pkgver}"
  install -Dm755 "target/release/uv" "${pkgdir}/usr/local/bin/uv"
  install -Dm755 "target/release/uvx" "${pkgdir}/usr/local/bin/uvx"
  install -Dm644 'LICENSE-MIT' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 'LICENSE-APACHE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
