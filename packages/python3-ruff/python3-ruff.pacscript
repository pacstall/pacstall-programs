pkgname='python3-ruff'
pkgver='0.17.1'
pkgdesc='Fast Python linter and code formatter, written in Rust'
license=('MIT')
repology=('project: python:ruff')
url='https://github.com/astral-sh/ruff'
arch=('any')
maintainer=('Erik Hedlund <erikcghedlund@outlook.com>')
_attestation_id='56321670'
source=(
  "ruff-${pkgver}.tar.gz::https://github.com/astral-sh/ruff/releases/download/${pkgver}/source.tar.gz"
  "attestations.json::https://github.com/astral-sh/ruff/attestations/${_attestation_id}/download"
)
noextract=("ruff-${pkgver}.tar.gz")
sha256sums=(
  'f0514f245685770aa34b4d689a7a16783beba245623df9b01d3f10716f4e82a3'
  '45ab13551cbe5b9d2cee806343186ec60c7a0baef5265be301c7c2b82e370090'
)
_min_cargo='1.97'
makedepends=("cargo-${_min_cargo} | cargo>=${_min_cargo} | rustup" "cosign")
external_connection=true

prepare() {
  cosign verify-blob-attestation "${srcdir}/ruff-${pkgver}.tar.gz" \
    --bundle "${srcdir}/attestations.json" \
    --new-bundle-format \
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
