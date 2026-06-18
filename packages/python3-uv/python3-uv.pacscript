pkgname='python3-uv'
pkgver='0.11.21'
pkgdesc='Fast Python package and project manager, written in Rust'
license=('Apache-2.0' 'MIT')
repology=('project: python:uv')
url='https://github.com/astral-sh/uv'
arch=('any')
maintainer=('Erik Hedlund <erikcghedlund@outlook.com>')
source=("https://github.com/astral-sh/uv/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('12316609d3cd474a67d9b7e08991db7ec19390395ba03f56e79d39c6afbb723a')
_min_cargo='1.94'
makedepends=("cargo-${_min_cargo} | cargo>=${_min_cargo}")
external_connection=true

build() {
  cd "${srcdir}/uv-${pkgver}"
  if type "cargo-${_min_cargo}"; then
    "cargo-${_min_cargo}" build -j"${NCPU}" --release --locked
  else
    cargo build -j"${NCPU}" --release --locked
  fi
}

package() {
  cd "${srcdir}/uv-${pkgver}"
  install -Dm755 "target/release/uv" "${pkgdir}/usr/local/bin/uv"
  install -Dm755 "target/release/uvx" "${pkgdir}/usr/local/bin/uvx"
  install -Dm644 'LICENSE-MIT' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 'LICENSE-APACHE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
