pkgname='mdbook'
arch=("any")
pkgver='0.5.2'
pkgdesc='Utility to create modern online books from Markdown files'
url='https://rust-lang.github.io/mdBook/'
repology=("project: ${pkgname}")
makedepends=('cargo>=1.88.0')
source=("https://github.com/rust-lang/mdBook/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2c8615a17c5670f9aa6d8dbf77c343cf430f95f571f28a87bb7aaa8f29c1ac5b')
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
