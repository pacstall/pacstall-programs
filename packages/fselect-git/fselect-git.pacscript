pkgname="fselect-git"
gives="fselect"
makedepends=("cargo" "rustc")
pkgdesc="Find files with SQL-like queries"
source=("https://github.com/jhspetersson/fselect.git")
arch=("any")
pkgver="0.8.4"
maintainer=("Diego Magdaleno <diegomagdaleno@pm.me>")
external_connection=true
incompatible=("debian:bullseye")

build() {
  cd "fselect"
  cargo build -j"${NCPU}" --release --locked
}

package() {
  cd "fselect"
  install -Dm755 target/release/fselect -t "${pkgdir}/usr/bin"
}
