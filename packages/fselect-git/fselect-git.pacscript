pkgname="fselect-git"
gives="fselect"
makedepends=("cargo" "rustc")
pkgdesc="Find files with SQL-like queries"
source=("https://github.com/jhspetersson/fselect.git")
pkgver="0.8.4"
maintainer=("Diego Magdaleno <diegomagdaleno@pm.me>")
incompatible=("debian:bullseye")

build() {
  cd "${_archive}"
  cargo build -j"${NCPU}" --release --locked
}

package() {
  cd "${_archive}"
  install -Dm755 target/release/fselect -t "${pkgdir}/usr/bin"
}
