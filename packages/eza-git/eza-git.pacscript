pkgname="eza-git"
gives="eza"
source=("https://github.com/eza-community/eza.git")
arch=("any")
pkgver="0.18.15"
url='https://eza.rocks'
makedepends=("cargo" "libgit2-dev" "cmake" "rustc" "pandoc")
pkgdesc="A modern, maintained replacement for ls"
external_connection=true
maintainer=("Elsie19 <elsie19@pm.me>")
incompatible=('debian:bookworm')

prepare() {
  cd "eza"
  mkdir -p target/man1 target/man5
}

build() {
  cd "eza"
  cargo build -j"${NCPU}" --release --locked
  pandoc --standalone -f markdown -t man "man/eza.1.md" > target/man1/eza.1
  pandoc --standalone -f markdown -t man "man/eza_colors.5.md" > target/man5/eza_colors.5
  pandoc --standalone -f markdown -t man "man/eza_colors-explanation.5.md" > target/man5/eza_colors-explanation.5
}

package() {
  cd "eza"
  # Install package
  install -Dm755 target/release/eza -t "${pkgdir}/usr/bin"
  # Install completions
  install -Dm644 completions/bash/eza -t "${pkgdir}/usr/share/bash-completion/completions/"
  install -Dm644 completions/fish/eza.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d/"
  install -Dm644 completions/zsh/_eza -t "${pkgdir}/usr/share/zsh/vendor-completions/"
  # Install man pages
  install -Dm644 target/man1/* -t "${pkgdir}/usr/share/man/man1/"
  install -Dm644 target/man5/* -t "${pkgdir}/usr/share/man/man5/"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${gives}/README.md"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${gives}/LICENSE"
}
