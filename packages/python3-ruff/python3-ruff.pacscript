pkgname='python3-ruff'
pkgver='0.17.4'
pkgdesc='Fast Python linter and code formatter, written in Rust'
license=('MIT')
repology=('project: python:ruff')
url='https://github.com/astral-sh/ruff'
arch=('any')
maintainer=('Erik Hedlund <erikcghedlund@outlook.com>')
_attestation_id='64177046'
source=(
  "ruff-${pkgver}.tar.gz::https://github.com/astral-sh/ruff/releases/download/${pkgver}/source.tar.gz"
  "attestations.json::https://github.com/astral-sh/ruff/attestations/${_attestation_id}/download"
)
noextract=("ruff-${pkgver}.tar.gz")
sha256sums=(
  'f8dcb8612f1ce95bc0ce806752c11a675688f299fa940445ba3edbe7cb2fff83'
  '481ef39b5eb6edc8daec224f3689b16a415ee2aebadda92901126abee6eb2ec4'
)
_min_cargo='1.97'
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
