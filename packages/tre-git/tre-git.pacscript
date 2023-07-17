name="tre-git"
pkgname="tre"
gives="tre"
build_depends=("cargo" "rustc")
description="Tree command, improved"
url="https://github.com/dduan/tre.git"
maintainer="Diego Magdaleno <diegomagdaleno@pm.me>"
incompatible=("debian:bullseye")
pkgver() {
  git ls-remote "${url}" main | cut -f1 | cut -c1-8
}
version="$(pkgver)"

build() {
  cargo build -j"$(nproc)" --release --locked
}

package() {
  sudo install -Dm755 target/release/tre -t "${pkgdir}/usr/bin"
}
