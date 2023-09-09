name="eza-git"
gives="eza"
url="https://github.com/eza-community/eza.git"
pkgver="0.10.0"
homepage='https://the.exa.website/'
makedepends=("cargo" "libgit2-dev" "cmake" "rustc")
pkgdesc="A modern, maintained replacement for ls"
maintainer="Elsie19 <elsie19@pm.me>"
pkgver() {
  git ls-remote "${url}" main | cut -f1 | cut -c1-8
}

build() {
  cargo build -j"${NCPU}" --release
}

package() {
  sudo install -Dm755 target/release/eza -t "${pkgdir}/usr/bin"
}
