pkgname="exa-git"
gives="exa"
source=("https://github.com/ogham/exa.git")
arch=("any")
pkgver="0.10.1"
url='https://the.exa.website/'
makedepends=("cargo" "libgit2-dev" "cmake" "rustc")
pkgdesc="exa is an improved file lister with more features and better defaults"
external_connection=true
maintainer=("Elsie19 <elsie19@pm.me>")

build() {
  cd "exa"
  cargo build -j"${NCPU}" --release
}

package() {
  cd "exa"
  install -Dm755 target/release/exa -t "${pkgdir}/usr/bin"
}
