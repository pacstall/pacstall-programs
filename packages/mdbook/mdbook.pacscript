pkgname='mdbook'
arch=("any")
pkgver='0.4.40'
pkgdesc='Utility to create modern online books from Markdown files'
url='https://rust-lang.github.io/mdBook/'
maintainer=()
repology=("project: ${pkgname}")
makedepends=('cargo')
source=("https://github.com/rust-lang/mdBook/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('550da7ff02ef62c60db6e813b6dbae65b9ed3d491186ea74929536feaceea94b')
external_connection='true'

prepare() {
  cd "mdBook-${pkgver}"
  CARGO_HOME=crates cargo fetch --locked
}

build() {
  cd "mdBook-${pkgver}"
  CARGO_HOME=crates cargo build -j"${NCPU}" --release --offline
}

check() {
  cd "mdBook-${pkgver}"
  CARGO_HOME=crates cargo test --offline
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
