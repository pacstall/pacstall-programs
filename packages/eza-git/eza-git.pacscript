name="eza-git"
gives="eza"
url="https://github.com/eza-community/eza.git"
pkgver="0.17.0"
homepage='https://the.exa.website/'
makedepends=("cargo" "libgit2-dev" "cmake" "rustc" "pandoc")
pkgdesc="A modern, maintained replacement for ls"
maintainer="Elsie19 <elsie19@pm.me>"
incompatible=('debian:bookworm')
pkgver() {
  git ls-remote "${url}" main | cut -f1 | cut -c1-8
}

prepare() {
  mkdir -p target/man1 target/man5
}

build() {
  cargo build -j"${NCPU}" --release --locked
  pandoc --standalone -f markdown -t man "man/eza.1.md" > target/man1/eza.1
  pandoc --standalone -f markdown -t man "man/eza_colors.5.md" > target/man5/eza_colors.5
  pandoc --standalone -f markdown -t man "man/eza_colors-explanation.5.md" > target/man5/eza_colors-explanation.5
}

package() {
  # Install package
  sudo install -Dm755 target/release/eza -t "${pkgdir}/usr/bin"
  # Install completions
  sudo install -Dm644 completions/bash/eza -t "${pkgdir}/usr/share/bash-completion/completions/"
  sudo install -Dm644 completions/fish/eza.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d/"
  sudo install -Dm644 completions/zsh/_eza -t "${pkgdir}/usr/share/zsh/vendor-completions/"
  # Install man pages
  sudo install -Dm644 target/man1/* -t "${pkgdir}/usr/share/man/man1/"
  sudo install -Dm644 target/man5/* -t "${pkgdir}/usr/share/man/man5/"
  sudo install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${gives}/README.md"
  sudo install -Dm644 "LICENCE" "${pkgdir}/usr/share/licenses/${gives}/LICENSE-MIT"
}
