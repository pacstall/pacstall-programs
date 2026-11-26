pkgname='kakoune-tree-sitter'
pkgver='3.2.2'
_source_pkgver='3.1.4' # This software handles releases weirdly, resulting in the release tag not necessarily matching with the version of the main component
_subproject='ktsctl'
pkgdesc='Tree-sitter plugin for Kakoune'
license=('BSD-3-Clause')
repology=('project: kak-tree-sitter')
url='https://git.sr.ht/~hadronized/kak-tree-sitter'
arch=('amd64' 'arm64' 'armhf' 'i386')
maintainer=('Erik Hedlund <erikcghedlund@outlook.com>')
source=("https://git.sr.ht/~hadronized/kak-tree-sitter/archive/ktsctl-v${_source_pkgver}.tar.gz")
sha256sums=('28c3c0509e1e05b4b49214dde44d73e8ca89632b6dc9b34fe9b6ffedb890b270')
_min_cargo='1.88'
makedepends=("cargo-${_min_cargo} | cargo>=${_min_cargo} | rustup")
depends=('tree-sitter-cli')
enhances=('kakoune')
external_connection=true

build() {
  cd "${srcdir}/kak-tree-sitter-${_subproject}-v${_source_pkgver}"
  export PATH="/usr/lib/rust-${_min_cargo}/bin:${PATH}"
  if [[ -x "$(command -v rustup)" ]]; then
    # We get an error due to lack of default rust version
    # (or at least I get on my machine)
    # if we don't manually set default
    rustup default "${_min_cargo}"
  fi
  cargo build -j"${NCPU}" --release --locked
}

check() {
  cd "${srcdir}/kak-tree-sitter-${_subproject}-v${_source_pkgver}"
  export PATH="/usr/lib/rust-${_min_cargo}/bin:${PATH}"
  if [[ -x "$(command -v rustup)" ]]; then
    rustup default "${_min_cargo}"
  fi
  cargo test
}

package() {
  cd "${srcdir}/kak-tree-sitter-${_subproject}-v${_source_pkgver}"
  install -Dm755 'target/release/kak-tree-sitter' "${pkgdir}/usr/local/bin/kak-tree-sitter"
  install -Dm755 'target/release/ktsctl' "${pkgdir}/usr/local/bin/ktsctl"
  install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
