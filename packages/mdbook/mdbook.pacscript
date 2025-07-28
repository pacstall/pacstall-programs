pkgname='mdbook'
arch=("any")
pkgver='0.4.51'
pkgdesc='Utility to create modern online books from Markdown files'
url='https://rust-lang.github.io/mdBook/'
repology=("project: ${pkgname}")
makedepends=('cargo')
source=("https://github.com/rust-lang/mdBook/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('de5ee916157784e32451b81de01cc4c669b73e651e2db00c7b1809254dbb6259')
external_connection=true

build() {
  cd "mdBook-${pkgver}"
  cargo build -j"${NCPU}" --release --locked
}

check() {
  cd "mdBook-${pkgver}"
  cargo test --locked
}

package() {
  cd "mdBook-${pkgver}"
  install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"

  _install_completion bash "bash-completion/completions/${pkgname}"
  _install_completion fish "fish/vendor_completions.d/${pkgname}.fish"
  _install_completion zsh "zsh/site-functions/_${pkgname}"
}

_install_completion() {
  ./target/release/"${pkgname}" completions "$1" \
    | install -Dm644 /dev/stdin "${pkgdir}/usr/share/$2"
}
