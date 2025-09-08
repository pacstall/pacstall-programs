pkgname='kakoune-tree-sitter'
pkgver='3.0.0'
pkgdesc='Tree-sitter plugin for Kakoune'
license=('BSD-3-Clause')
repology=('project: kak-tree-sitter')
url='https://git.sr.ht/~hadronized/kak-tree-sitter'
arch=('amd64' 'arm64' 'armhf' 'i386')
maintainer=('Erik Hedlund <erikcghedlund@outlook.com>')
source=("https://git.sr.ht/~hadronized/kak-tree-sitter/archive/kak-tree-sitter-config-v${pkgver}.tar.gz")
sha256sums=('9b3142ce81872de3e7f68390e2d2b510cb7d20bb3c51ad22832e94abb648fbfe')
_min_cargo='1.86'
makedepends=("cargo-${_min_cargo} | cargo>=${_min_cargo}")
depends=('tree-sitter-cli')
enhances=('kakoune')
external_connection=true

build() {
  cd "${srcdir}/kak-tree-sitter-kak-tree-sitter-config-v${pkgver}"
  if type "cargo-${_min_cargo}"; then
    "cargo-${_min_cargo}" build -j"${NCPU}" --release --locked
  else
    cargo build -j"${NCPU}" --release --locked
  fi
}

check() {
  cd "${srcdir}/kak-tree-sitter-kak-tree-sitter-config-v${pkgver}"
  if type "cargo-${_min_cargo}"; then
    RUSTDOC="rustdoc-${_min_cargo}" "cargo-${_min_cargo}" test
  else
    cargo test
  fi
}

package() {
  cd "${srcdir}/kak-tree-sitter-kak-tree-sitter-config-v${pkgver}"
  install -Dm755 'target/release/kak-tree-sitter' "${pkgdir}/usr/local/bin/kak-tree-sitter"
  install -Dm755 'target/release/ktsctl' "${pkgdir}/usr/local/bin/ktsctl"
  install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
