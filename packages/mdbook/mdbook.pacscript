pkgname='mdbook'
arch=("any")
pkgver='0.5.4'
pkgdesc='Utility to create modern online books from Markdown files'
url='https://rust-lang.github.io/mdBook/'
repology=("project: ${pkgname}")
makedepends=('cargo>=1.88.0 | rustup')
source=("https://github.com/rust-lang/mdBook/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('107614330c35c77d53b6f6ce7826c50eed087650efe5646a4d0a16ca6bf5544b')
external_connection=true

build() {
  cd "mdBook-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo build -j"${NCPU}" --release --locked
}

check() {
  cd "mdBook-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
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
