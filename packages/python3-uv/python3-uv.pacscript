pkgname='python3-uv'
pkgver='0.13.7'
pkgdesc='Fast Python package and project manager, written in Rust'
license=('Apache-2.0' 'MIT')
repology=('project: python:uv')
url='https://github.com/astral-sh/uv'
arch=('any')
maintainer=('Erik Hedlund <erikcghedlund@outlook.com>')
_attestation_id='62929524'
source=(
  "uv-${pkgver}.tar.gz::https://github.com/astral-sh/uv/releases/download/${pkgver}/source.tar.gz"
  "attestations.json::https://github.com/astral-sh/uv/attestations/${_attestation_id}/download"
)
noextract=("uv-${pkgver}.tar.gz")
sha256sums=(
  '6e44f545ee8e9037bcc7c375018bc2c38d84327a6d08f3eb51525444ab50d21a'
  '245b49b4473adfd8439afcc06b994e710bdeec9b1cecee09eed4f31951eb15f4'
)
_min_cargo='1.97'
makedepends=("cargo-${_min_cargo} | cargo>=${_min_cargo} | rustup" 'cosign')
external_connection=true

prepare() {
  cosign verify-blob-attestation "${srcdir}/uv-${pkgver}.tar.gz" \
    --bundle "${srcdir}/attestations.json" \
    --type 'https://slsa.dev/provenance/v1' \
    --certificate-oidc-issuer 'https://token.actions.githubusercontent.com' \
    --certificate-identity "${url}/.github/workflows/release.yml@refs/heads/main" \
    || return 1

  tar xf "${srcdir}/uv-${pkgver}.tar.gz"
}

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
