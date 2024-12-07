pkgname="tre-git"
gives="tre"
makedepends=("cargo" "rustc")
pkgdesc="Tree command, improved"
source=("https://github.com/dduan/tre.git")
arch=("all")
pkgver="0.4.0"
maintainer=("Diego Magdaleno <diegomagdaleno@pm.me>")
external_connection=true
incompatible=("debian:bullseye")

build() {
  cd "tre"
  cargo build -j"${NCPU}" --release --locked
}

package() {
  cd "tre"
  install -Dm755 target/release/tre -t "${pkgdir}/usr/bin"
}
