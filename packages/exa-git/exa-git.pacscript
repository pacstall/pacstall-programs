pkgname="exa-git"
gives="exa"
source=("https://github.com/ogham/exa.git")
pkgver="0.10.1"
homepage='https://the.exa.website/'
makedepends=("cargo" "libgit2-dev" "cmake" "rustc")
pkgdesc="exa is an improved file lister with more features and better defaults"
maintainer=("Elsie19 <elsie19@pm.me>")

build() {
  cd "${_archive}"
  cargo build -j"${NCPU}" --release
}

package() {
  cd "${_archive}"
  install -Dm755 target/release/exa -t "${pkgdir}/usr/bin"
}
