name="tre-git"
pkgname="tre"
gives="tre"
makedepends=("cargo" "rustc")
pkgdesc="Tree command, improved"
source=("https://github.com/dduan/tre.git")
pkgver="0.4.0"
maintainer="Diego Magdaleno <diegomagdaleno@pm.me>"
incompatible=("debian:bullseye")

build() {
  cargo build -j"${NCPU}" --release --locked
}

package() {
  sudo install -Dm755 target/release/tre -t "${pkgdir}/usr/bin"
}
