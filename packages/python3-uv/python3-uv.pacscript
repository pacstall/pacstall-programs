pkgname='python3-uv'
pkgver='0.11.26'
pkgdesc='Fast Python package and project manager, written in Rust'
license=('Apache-2.0' 'MIT')
repology=('project: python:uv')
url='https://github.com/astral-sh/uv'
arch=('any')
maintainer=('Erik Hedlund <erikcghedlund@outlook.com>')
source=("https://github.com/astral-sh/uv/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('3af425f543cca1b4af1cf6829b15f7a1deb9d39bca57c04f70e15042a7bc4a3a')
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
