pkgname='python3-uv'
pkgver='0.12.18'
pkgdesc='Fast Python package and project manager, written in Rust'
license=('Apache-2.0' 'MIT')
repology=('project: python:uv')
url='https://github.com/astral-sh/uv'
arch=('any')
maintainer=('Erik Hedlund <erikcghedlund@outlook.com>')
source=("https://github.com/astral-sh/uv/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('19ddf8a5a173d24f3a56e9a625f3fafcc5771eb4b549d629bccfca5fc62cfb34')
_min_cargo='1.96'
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
