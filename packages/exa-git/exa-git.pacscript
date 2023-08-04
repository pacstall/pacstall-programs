name="exa-git"
pkgname="exa"
gives="exa"
url="https://github.com/ogham/exa.git"
homepage='https://the.exa.website/'
makedepends=("cargo" "libgit2-dev" "cmake" "rustc")
description="exa is an improved file lister with more features and better defaults"
maintainer="Elsie19 <hwengerstickel@pm.me>"
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}
version="$(pkgver)"

build() {
  cargo build -j"${NCPU}" --release
}

package() {
  sudo install -Dm755 target/release/exa -t "${pkgdir}/usr/bin"
}
