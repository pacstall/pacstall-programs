pkgname='python3-uv'
pkgver='0.13.5'
pkgdesc='Fast Python package and project manager, written in Rust'
license=('Apache-2.0' 'MIT')
repology=('project: python:uv')
url='https://github.com/astral-sh/uv'
arch=('any')
maintainer=('Erik Hedlund <erikcghedlund@outlook.com>')
_attestation_id='58461417'
source=(
  "uv-${pkgver}.tar.gz::https://github.com/astral-sh/uv/releases/download/${pkgver}/source.tar.gz"
  "attestations.json::https://github.com/astral-sh/uv/attestations/${_attestation_id}/download"
)
noextract=("uv-${pkgver}.tar.gz")
sha256sums=(
  '1af98369e94f841426a673323760155d7507119c05c55456bdecbcb151eaaea4'
  '2275a313c794bcbd0caf14e5cd5b14c6c4ae6207ef4d2c2f93b8e456b37d837a'
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
