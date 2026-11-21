pkgname='python3-ruff'
pkgver='0.17.6'
pkgdesc='Fast Python linter and code formatter, written in Rust'
license=('MIT')
repology=('project: python:ruff')
url='https://github.com/astral-sh/ruff'
arch=('any')
maintainer=('Erik Hedlund <erikcghedlund@outlook.com>')
_attestation_id='69725324'
source=(
  "ruff-${pkgver}.tar.gz::https://github.com/astral-sh/ruff/releases/download/${pkgver}/source.tar.gz"
  "attestations.json::https://github.com/astral-sh/ruff/attestations/${_attestation_id}/download"
)
noextract=("ruff-${pkgver}.tar.gz")
sha256sums=(
  '0378ef60356caaad7b84653691a5d57a1d8b57fd59d173cfc27b0fd4a91a13f3'
  '5813b0ebc960f89ded17829a1430d7acb8099e5897b0b8a8f39b7984a0f25c5d'
)
_min_cargo='1.98'
makedepends=("cargo-${_min_cargo} | cargo>=${_min_cargo} | rustup" "cosign")
external_connection=true

prepare() {
  cosign verify-blob-attestation "${srcdir}/ruff-${pkgver}.tar.gz" \
    --bundle "${srcdir}/attestations.json" \
    --type 'https://slsa.dev/provenance/v1' \
    --certificate-oidc-issuer 'https://token.actions.githubusercontent.com' \
    --certificate-identity "${url}/.github/workflows/release.yml@refs/heads/main" \
    || return 1

  tar xf "${srcdir}/ruff-${pkgver}.tar.gz"
}

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
