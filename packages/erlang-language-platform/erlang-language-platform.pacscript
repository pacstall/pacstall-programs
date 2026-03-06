pkgname='erlang-language-platform'
pkgver='2026-02-10'
pkgdesc='LSP server and CLI for the Erlang programming language'
license=('Apache-2.0' 'MIT')
repology=('project: elp')
url='https://whatsapp.github.io/erlang-language-platform'
arch=('any')
maintainer=('Erik Hedlund <erikcghedlund@outlook.com>')
source=("https://github.com/WhatsApp/erlang-language-platform/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('11c0366637df4b2e388bcbadca3cb16828120d272bece3e8eb8f8b1554e4ec78')
_min_cargo='1.91'
makedepends=("cargo-${_min_cargo} | cargo>=${_min_cargo}" 'erlang' 'rebar3' 'sed')
depends=('erlang')
pacdeps=('erlfmt' 'eqwalizer')
external_connection=true

prepare() {
  #This is super-hacky but needs to be done for some reason. (The build process seems to be unable to dereference '$EQWALIZER_SUPPORT_DIR' at compile time).

  # Pacstall CI should not care about whether an external file follows its rule
  # shellcheck source=/dev/null
  source /etc/environment.d/eqwalizer.conf

  # We **do not* want to expand $EQWALIZER_SUPPORT_DIR
  # shellcheck disable=SC2016
  sed -i "$(printf 's;$EQWALIZER_SUPPORT_DIR;%s;' "${EQWALIZER_SUPPORT_DIR}")" "${srcdir}/${pkgname}-${pkgver}/crates/elp/src/bin/main.rs"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  if type "cargo-${_min_cargo}"; then
    "cargo-${_min_cargo}" build -j"${NCPU}" --release
  else
    cargo build -j"${NCPU}" --release
  fi
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 'target/release/elp' "${pkgdir}/usr/local/bin/elp"
  install -Dm644 'LICENSE-MIT' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 'LICENSE-APACHE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
