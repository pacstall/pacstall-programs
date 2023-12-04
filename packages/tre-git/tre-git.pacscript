name="tre-git"
gives="tre"
makedepends=("cargo" "rustc")
pkgdesc="Tree command, improved"
url="https://github.com/dduan/tre.git"
pkgver="0.4.0"
maintainer="Diego Magdaleno <diegomagdaleno@pm.me>"
incompatible=("debian:bullseye")
pkgver() {
  git ls-remote "${url}" main | cut -f1 | cut -c1-8
}

build() {
  cargo build -j"${NCPU}" --release --locked
}

package() {
  sudo install -Dm755 target/release/tre -t "${pkgdir}/usr/bin"
}
