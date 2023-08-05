name="fselect-git"
gives="fselect"
makedepends=("cargo" "rustc")
pkgdesc="Find files with SQL-like queries"
url="https://github.com/jhspetersson/fselect.git"
pkgver="0.8.4"
maintainer="Diego Magdaleno <diegomagdaleno@pm.me>"
incompatible=("debian:bullseye")
pkgver() {
  git ls-remote "${url}" master | cut -f1 | cut -c1-8
}

build() {
  cargo build -j"${NCPU}" --release --locked
}

package() {
  sudo install -Dm755 target/release/fselect -t "${pkgdir}/usr/bin"
}
